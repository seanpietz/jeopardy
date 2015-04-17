require 'fun.rb'

task :delete_episodes => :environment do
  puts" deleting episodes"
  Episode.connection.execute("delete from episodes")
  Episode.connection.execute("update sqlite_sequence set seq = 0 where name = 'episodes'")
end

task :delete_categories => :environment do
  puts" deleting categories"
  Category.connection.execute("delete from categories")
  Category.connection.execute("update sqlite_sequence set seq = 0 where name = 'categories'")
end

task :delete_questions => :environment do
  puts" deleting questions"
  Question.connection.execute("delete from questions")
  Question.connection.execute("update sqlite_sequence set seq = 0 where name = 'questions'")
end

task :testask => [:delete_episodes, :delete_questions, :environment] do
  File.open('/home/sean/jeopardy/JEOPARDY_QUESTIONS1.json', 'r') do |file|
	  File.each do |line|
      data = JSON.parse line
      len = data.length
      count = 0
      data.map do |x|
        episode = Episode.find_by show_number: x["show_number"]
        unless episode
          episode = Episode.create do |e|
            e.show_number = x["show_number"] 
            e.air_date = x["air_date"]
          end
        end
        category = Category.where(
          ["category = ? and episode_id = ?", x["category"], episode.id]
        ).first
        unless category
          category = Category.create do |c|
            c.category = x["category"]
            c.round = x["round"]
            c.episode_id = episode.id
          end
        end
        Question.create do |q|
          q.question = x["question"]
          q.value = x["value"]
          q.answer = x["answer"]
          q.category_id = category.id
        end
        count += 1
        puts "#{count} / #{len}"
      end
	  end
  end
end
class Episode < ActiveRecord::Base
	validates_uniqueness_of :show_number
	has_many :categories
	def self.get_rand
		rand_id = rand(self.count)
		puts rand_id
		self.where('id >= ?', rand_id).first
	end
	def get_categories_by_round(num)
		self.categories.select do |c|
			c.round_number == num
		end #.map { |c| c.category }
	end
end

class Category < ActiveRecord::Base
	belongs_to :episode
	has_many :questions
	def round_number
		case self.round
		when "Jeopardy!"
			1
		when "Double Jeopardy!"
			2
		when "Final Jeopardy!"
			3
		else 
			raise KeyError, "Unknown round name: #{self.round}", caller
        end
    end		
end


class Guess < ApplicationRecord
    belongs_to :user
    belongs_to :round 
    belongs_to :complaint

    def correct_guess?
        if self.guess == self.complaint.user.id
            true
        else 
            false
        end
    end
end

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
    def apply_score
        if correct_guess? 
            self.user.current_session.score_point
        end
    end
end

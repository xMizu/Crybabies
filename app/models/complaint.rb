class Complaint < ApplicationRecord
    belongs_to :user
    belongs_to :round 

    def guess(user, num)
        Guess.create(user: user,complaint: self,guess: num, round: self.round)
        
    end
end

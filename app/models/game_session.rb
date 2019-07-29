class GameSession < ApplicationRecord
    belongs_to :user
    belongs_to :game 

    def score_point
        one_up
    end
    private
    def one_up
        self.score += 1
        self.save
    end
end

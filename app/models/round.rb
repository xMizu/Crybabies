class Round < ApplicationRecord
    belongs_to :game
    belongs_to :topic 
    has_many :complaints
    has_many :guesses

    def player_count
        self.game.user_count
    end
    def number_of_expected_guesses
        self.player_count*(self.player_count-1)
    end 

    def complaint_phase?
        if self.complaints.length < player_count
            true
        else
            false
        end
    end

    def guess_phase?  
        if self.guesses.length < self.number_of_expected_guesses
            true 
        else
            false 
        end
    end
    def finished?
        if  !guess_phase? && !complaint_phase?
            true
        else
            false
        end 
    end
end

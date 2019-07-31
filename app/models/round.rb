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
    def users 
        self.game.users
    end

    def finished_rounds
        (game.rounds.select {|r| r.finished?}).count
    end

    def score_for_round(user)
        #TODO inefficient
        self.guesses.select {|g| g.user == user && g.correct_guess? && g.round == self}.length 
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

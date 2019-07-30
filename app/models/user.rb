class User < ApplicationRecord
    has_many :game_sessions
    has_many :games, through: :game_sessions
    has_many :guesses
    has_many :complaints
    has_secure_password

    def current_session?
        #TODO fix this shit
        if self.games.empty? 
            false
        else 
            if self.games.last.finished? 
                false
            else
                true
            end
        end
    end

    def current_round?
        if self.current_session? == true && self.games.last.rounds.empty? 
            self.games.last
        else
            self.games.last.rounds.last
        end
    end
                

    def score 
        current_session.score
    end

    
end

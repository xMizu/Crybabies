class User < ApplicationRecord
    has_many :game_sessions
    has_many :games, through: :game_sessions
    has_many :guesses
    has_many :complaints
    has_secure_password

    def current_session
        #TODO fix this shit
        if self.games.last != nil
            !self.games.last.finished?
        else
            false
        end
    end
    def score 
        current_session.score
    end

    
end

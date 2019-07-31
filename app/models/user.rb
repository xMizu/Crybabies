class User < ApplicationRecord
    after_validation :set_slug, only: [:create, :update]
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

    def to_param
        "#{id}-#{slug}"
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

    private

    def set_slug
    self.slug = name.parameterize
    end 

    
end

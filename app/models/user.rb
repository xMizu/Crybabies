class User < ApplicationRecord
    after_validation :set_slug, only: [:create, :update]
    has_many :game_sessions
    has_many :games, through: :game_sessions
    has_many :guesses
    has_many :complaints
    validates :name, presence: true
    validates :email, uniqueness: true
    validates :email, presence: true
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
    def current_game
        if self.current_session? 
            self.games.last
        else
            false
        end
    end

    def guesses_submitted?
        round = self.current_game.rounds.last 
        guesses = round.guesses.where(user: self)
        guesses.length == ((current_game.user_count) - 1)
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
                

    def total_score 
        self.game_sessions.last.score
    end

    private

    def set_slug
    self.slug = name.parameterize
    end 

    
end

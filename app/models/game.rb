class Game < ApplicationRecord
    has_many :rounds 
    has_many :game_sessions
    has_many :users, through: :game_sessions
    validates :max_rounds, numericality: {greater_than: 0}
    validates :user_count, numericality: {greater_than: 1}


    def started?
        if GameSession.where(game_id: self.id).count == self.user_count
            true
        else
            false
        end
    end
end

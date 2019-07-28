class Round < ApplicationRecord
    belongs_to :game
    has_many :complaints
    has_many :guesses
    
end

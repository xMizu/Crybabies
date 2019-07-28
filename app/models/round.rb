class Round < ApplicationRecord
    belongs_to :game
    belongs_to :topic 
    has_many :complaints
    has_many :guesses
    
end

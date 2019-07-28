class Guess < ApplicationRecord
    belongs_to :user
    belongs_to :round 
    belongs_to :complaint
end

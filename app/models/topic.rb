class Topic < ApplicationRecord
    has_many :rounds
    has_many :complaints, through: :rounds 
end

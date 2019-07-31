class Topic < ApplicationRecord
    has_many :rounds
    has_many :complaints, through: :rounds 

    def self.select_topic
        x= [Faker::Hipster.word,Faker::Game.title,Faker::Food.dish,Faker::Book.genre,Faker::Creature::Animal.name].sample
        x
    end

end

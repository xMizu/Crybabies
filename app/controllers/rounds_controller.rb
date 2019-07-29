class RoundsController < ApplicationController
    def create
     topic = Topic.create   
     game = Game.find(params[:id])
     @Round.create(topic: topic,game:game)
     #TODO figure out round redirect.
    end
end

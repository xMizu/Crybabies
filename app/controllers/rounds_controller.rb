class RoundsController < ApplicationController
    def create
    byebug
        @topic = Topic.find(Topic.pluck(:id).sample)
        # randomTopicGenerator = rand(Topic.count)
        # @topic = Topic.find(randomTopicGenerator)
        @game = Game.find(params[:id])
        @round = Round.create(topic: @topic.id,game_id: @game.id)
        redirect_to @round
        #TODO figure out round redirect.
    end

    def index
    
    end
end

class RoundsController < ApplicationController
    def create
        byebug
            @game = Game.find(params[:id])
        if @game.rounds.count == 0 
            @topic = Topic.find(Topic.pluck(:id).sample)
            @round = Round.create(topic_id: @topic.id,game_id: @game.id)
        else
            @round = Round.find(@game.rounds.last.id)
        end
        redirect_to @round
    end

    def index
    
    end

    def show
        @user = User.find(session[:user_id])
        @round = Round.find(params[:id])
    end
end

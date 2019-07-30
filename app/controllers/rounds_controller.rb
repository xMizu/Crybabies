class RoundsController < ApplicationController
    def create
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
        @round = Round.find(params[:id])
        @user = User.find(session[:user_id])
        session[:round_id] = @round.id
        if @complaint = Complaint.find_by(user_id: @user.id, round_id: @round.id)
        else
            @complaint = Complaint.new
        end
    end
end

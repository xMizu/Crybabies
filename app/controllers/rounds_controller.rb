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
    def guess 
       @round = Round.find(params[:id]) 
       #TODO fix this horseshit
       @complaints = Complaint.all.select {|c| c.round_id == params[:id].to_i && c.user_id != session[:user_id].to_i} 
       @opponents = @round.game.users.select {|u| u.id != session[:user_id].to_i}
    end
    def send_guess
        @player = User.find(session[:user_id])
        @complaints = Complaint.all.select {|c| c.round_id == params[:id].to_i && c.user_id != session[:user_id].to_i}
    end
end

class RoundsController < ApplicationController
    def create
     topic = Topic.create   
     game = Game.find(params[:id])
     @Round.create(topic: topic,game:game)
     #TODO figure out round redirect.
    end
    def guess 
       @round = Round.find(params[:id]) 
       #TODO fix this horseshit
       @complaints = Complaint.all.select {|c| c.round_id == params[:id].to_i && c.user_id != session[:user_id].to_i} 
       @opponents = @round.game.users.select {|u| u.id != session[:user_id].to_i}
    end
    def send_guess
        @player = User.find(session[:id])
        @complaints = Complaint.all.select {|c| c.round_id == params[:id].to_i && c.user_id != session[:user_id].to_i}
        byebug
    end
end

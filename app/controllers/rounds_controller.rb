
class RoundsController < ApplicationController
    def create
            @game = Game.find(params[:game_id])
        if @game.rounds.count == 0 || @game.rounds.last.finished?
            @topic = Topic.find_or_create_by(name: Topic.select_topic)
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
        @user = User.find(session[:user_id]) 
    begin
        @user.guesses_submitted?
        @round = Round.find(params[:id])
        game = @round.game 
        #TODO fix this horseshit
 
        @complaints =  @round.complaints.where.not(user_id: session[:user_id])
        @opponents = game.users.where.not(id: session[:user_id])
    rescue 
        
        redirect_to user_path(@user.id)
    end 
    
    end

    def score

        @round = Round.find(params[:id])
        @user = User.find(session[:user_id])
        @game = @user.games.last
        @current_round = @game.rounds.count
        if !@round.finished?
            redirect_to round_guesses_path(@round.id)
        else
           
            # params[:guesses_submitted] = nil 
        end

    end
    def send_guess
        player = User.find(session[:user_id])
        round = Round.find(params[:id])
        complaints = Complaint.all.select {|c| c.round_id == params[:id].to_i && c.user_id != session[:user_id].to_i}
        complaints.each_with_index do |c,i|
            c.guess(player,params["guess#{i}"][:user_id])
        end
        if round.finished?
            redirect_to round_score_path(round.id)
        else 
            
            redirect_to round_guesses_path(round.id)
        end
    end
end

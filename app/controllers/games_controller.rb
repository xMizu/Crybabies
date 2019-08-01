class GamesController < ApplicationController
    def show
        @game = Game.find(params[:id])
        @game_session = GameSession.where(game_id: @game.id)
    end
    def new
        @game = Game.new 
    end
    def create
        @game = Game.new(game_params)
        if @game.valid?
            @game.save
            GameSession.find_or_create_by(user_id: session[:user_id],game_id: @game.id)
            @game_session = GameSession.where(game_id: @game.id)
            redirect_to @game
        else 
            flash.now[:message] = @game.errors.full_messages[0]
            render :new 
        end
    end

    def index
        @games = Game.all.select {|g| g.started? == false }
        # @games = Game.all
    end


    def update
        @game = Game.find(params[:id])
        @players = GameSession.find_or_create_by(game_id: @game.id , user_id: session[:user_id])
        redirect_to @game
    end




    private 
    def game_params
        params.require(:game).permit(:user_count,:max_rounds)
    end

end

class GamesController < ApplicationController
    def show
        @game = Game.find(params[:id])
        @players = GameSession.find_by(game_id: @game.id)
    end
    def new
        @game = Game.new 
    end
    def create
        #TODO figure out how to make a game session for the current user. 
        @game = Game.new(game_params)
        if @game.valid?
            @game.save
\            redirect_to @game
        else 
            flash.now[:message] = @game.errors.full_messages[0]
            render :new 
        end
    end

    def started?
        @game = game.find(parms[:id])
    end




    private 
    def game_params
        params.require(:game).permit(:user_count,:max_rounds)
    end

end

class GamesController < ApplicationController
    def show
        @game = Game.find(params[:id])
    end
    def new
        @game = Game.new 
        
    end
    def create
        #TODO figure out how to make a game session for the current user. 
        @game.new(game_params)
        if @game.valid?
            @game.save
        else 
            #TODO Handle invalid game 
        end
    end
    private 
    def game_params
        params.require(:game).permit(:user_count,:max_rounds)
    end

end

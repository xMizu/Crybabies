class GameSessionsController < ApplicationController
  def create
    @game_session = GameSession.create game_session_params
    #TODO redirect_to round?
  end

  def update
    render :show
  end

  def show
    #Generate a randomn Topic
    # @topic = Topic.all.sample
    @score = @game_session.score
    #create new instances for users to submit guesses
    # @guesses = Guess.new
    @game_session = GameSession.find(params[:id])
    
  end

  def index
  end

  private

  def game_session_params
    params.require(:game_session).permit(:user_id,:game_id)
  end
end

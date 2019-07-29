class GuessesController < ApplicationController
  def create
    @guess = Guess.create guess_params
    #TODO find redirect_to 
  end

  # Guess Creation is shown on the round page
  # def new
  # end

  def index
    @guesses = Guess.all
  end

  private

  def guess_params
    params.require(:guess).permit(:user_id,:round_id, :complaint_id, :guess)
    #TODO make sure these params are in the round show page
  end
end

class ComplaintsController < ApplicationController


  def create
    @user = User.find(session[:user_id])
    @round = Round.find(session[:round_id])
    @complaint = Complaint.find_or_create_by(complain_text: params[:complaint][:complain_text], round_id: @round.id, user_id: @user.id)
    redirect_to @round
    #TODO created in round page
  end

  def index
    @complaints = Complaint.all
  end

end

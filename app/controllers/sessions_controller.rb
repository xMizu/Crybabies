class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(params[:username])
    if @user && @user.authenticate(params[:password])
        session[:user_id] = @user.id 
        redirect_to @user
    else
        flash[:message]
        render :new 
    end
  end

  def destroy
  end
end

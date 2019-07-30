class SessionsController < ApplicationController
  def new
    session[:user_id] = nil
    session[:round_id] = nil
  end

  def create
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
        session[:user_id] = @user.id 
        redirect_to @user
    else
        flash[:message] = "Password does not match Email entered"
        render login_path 
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_path
  end
end

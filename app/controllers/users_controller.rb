class UsersController < ApplicationController
    before_action :authorized?, except: [:new,:create]

    def new
        @user = User.new 
    end
    def show
        @user = User.find(session[:user_id])
        
        if @user.current_session?
            @path = @user.current_round?
        end
    end

    def delete
        @user = User.find(session[:user_id])
        @user.delete 
        redirect_to root_path 
    end
    def create
        @user = User.new(user_params)
        if @user.valid?
            @user.save 
            redirect_to login_path
        else 
            flash[:message] = @user.errors.full_messages
            redirect_to signup_path
            #TODO need to handle invalid user
        end
    end

    


    private 
    def user_params
        params.require(:user).permit(:name,:email,:password)
    end
end

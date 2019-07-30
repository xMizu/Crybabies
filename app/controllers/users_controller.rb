class UsersController < ApplicationController
    def new
        @user = User.new 
    end
    def show
        @user = User.find(params[:id])
        if @user.current_session?
            @path = @user.current_round?
        end
    end

    def delete
        @user = User.find(params[:id])
        @user.delete 
        redirect_to root_path 
    end
    def create
        @user = User.new(user_params)
        if @user.valid?
            @user.save 
            redirect_to login_path
        else 
            #TODO need to handle invalid user
        end
    end

    


    private 
    def user_params
        params.require(:user).permit(:name,:email,:password)
    end
end

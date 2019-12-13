class UsersController < ApplicationController
    def index
    end
    
    def edit
        @user = current_user
    end
    def update
        # @product = User.find(params[current_user.id])
        @user = current_user
        if @user.update_attributes(user_params)
          flash[:success] = "User updated"
          redirect_to users_path
        else   
          flash[:error] = 'Failed to edit user!'   
          render :edit   
        end   
    end
    
    def user_params   
        params.require(:user).permit(:name, :gender, :birthday, :nickname, :img)
    end   
end

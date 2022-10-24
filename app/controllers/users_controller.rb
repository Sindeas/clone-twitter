class UsersController < ApplicationController
  def create
    @user = User.new(user_params)

    if @user.save
      render 'users/create'
    else
      render json: {
        success: false
      }
    end
  end



  
  def profile
    @user = User.find(params[:id])
    redirect_to not_found_path unless @user
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :username)
  end
end

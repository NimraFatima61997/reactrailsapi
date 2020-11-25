class UsersController < ApplicationController
  def index
    render json: User.where(user_type:"Novice")
  end
  def update
    user = User.find(user_params[:id])
    user.update_attributes(user_params)
    render json: user
  end
  def currentuser
    render json: current_user
  end
  def show
  end
  def user_sign_in
    if user_signed_in?
      render json: true
    else
      render json: false
    end
  end
  private 
    def user_params
      params.require(:user).permit(:id,:status)
    end
end

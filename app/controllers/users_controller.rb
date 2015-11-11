class UsersController < ApplicationController

  # def index
  #   @user = User.all
  # end


  # def new
  #   @user = User.new
  # end

  # def create
  #   @user = User.new(user_params)
  # if @user.save
  #   redirect_to user_path
  # else
  #   render :new
  # end

  def show


  end

  # def edit
  # end

  # def update
  #   @user.update(user_params)
  #   redirect_to users_path
  # end

private
  def user_params
      params.require(:user).permit(:last_name, :first_name, :phone_number, :passeword, :email, :password_confirmation, :end_date )
  end
end

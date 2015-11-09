class UsersController < ApplicationController

  def index
    @user = User.all
  end

  def show

  end

  def edit
  end

  def update
    @user.update(user_params)
    redirect_to users_path
  end

private

  def user_params
    params.require(:user).permit(:????, )
  end
end

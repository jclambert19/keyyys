class BunchesController < ApplicationController
before_action :set_bunch, only: [:show,]

  def index
    @bunch = Bunch.all
  end

  def show

  end

  def new

    @bunch = Bunch.new
  end

  def create
    @bunch = @user.bunches.new(bunch_params)
    @bunch.save
    redirect_to user_bunch_path(@user, @bunch)
  end


private

  def set_bunch
    @user = User.find(params[:user_id])
  end

  def bunch_params
    params.require(:bunch).permit( :user, :name, :bunch_number, :in_safe, :received_on, :description, :number_of_items)
  end
end

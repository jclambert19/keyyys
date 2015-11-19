class BunchesController < ApplicationController
  before_action :authenticate_user!

  # before_action :set_bunch, only: [:show]

  def index
    @bunches = current_user.bunches.all
  end

  def show

  end

  # def create
  #   @bunch = current_user.bunches.new(bunch_params)
  #   @bunch.subscription = Subscription.find(params[:subscription_id])
  #   @bunch.save
  #   redirect_to subscription_path(@bunch.subscription)
  # end


# private

  # def set_bunch
  #   @user = Bunch.find(params[:id])
  # end

  # def bunch_params
  #   params.require(:bunch).permit( :user, :name, :bunch_number, :in_safe, :received_on, :description, :number_of_items)
  # end
end

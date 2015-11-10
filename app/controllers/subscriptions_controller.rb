class SubscriptionsController < ApplicationController


def new
  @subscription = Subscription.new
end

def create
  @subscription = Subscription.new(subscription_params)
  if @subscription.save
    redirect_to user_path(current_user)
  else
    render :new
  end
end

def edit
end

def update
end

private

  def set_subscription
    @subscription = Subscription.find(params[:id])
  end

  def subscription_params
    params.require(:subscription).permit( :start_date, :end_date, :rdv_location, :rdv_date, bunches_attributes: [:id, :name, :in_safe, :description, :number_of_itmes, :_destroy])
  end
end

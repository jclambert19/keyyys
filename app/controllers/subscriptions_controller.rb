class SubscriptionsController < ApplicationController
  before_action :authenticate_user!

  def index
    @subscriptions = Subscription.where.not(latitude: nil)

    # Let's DYNAMICALLY build the markers for the view.
    @subscriptions = Gmaps4rails.build_markers(@subscriptions) do |subscription, marker|
      marker.lat subscription.latitude
      marker.lng subscription.longitude
    end
  end


  def new
    @subscription = Subscription.new
  end

  def create
    @subscription = current_user.subscriptions.new(subscription_params)

    if @subscription.save
      respond_to do |format|
        format.js
      end
    else
      render :new
    end
  end

  def show
    @subscription = Subscription.find(params[:id]) #.order(created_at: :desc).first
    @bunch = Bunch.new

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
    params.require(:subscription).permit( :start_date, :end_date, :rdv_location, :rdv_date, bunches_attributes: [:id, :name, :in_safe, :description, :number_of_items, :_destroy])
  end
end

class SubscriptionsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_subscription, only: [:edit]

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
    @subscription = current_user.subscriptions.build(subscription_params)
    parse_hour = Time.parse(params[:rdv_hour])
    @subscription.rdv_date = @subscription.rdv_date + parse_hour.hour.hours + parse_hour.min.minutes
    @subscription.state = "pending"
    @subscription.price = 30
    if @subscription.save
      redirect_to new_subscription_payment_path(@subscription)
      # respond_to do |format|
      #   format.js
      # end
    else
      render :new
    end
  end

  def show
    @subscription = Subscription.find(params[:id]) #.order(created_at: :desc).first
  end

  def edit
  end

  def update
    if @subscription.update(subscription_params)
      respond_to do |format|
        format.js
      end
    else
      render :new
    end
  end

  private

  def set_subscription
    @subscription = Subscription.find(params[:id])
  end

  def subscription_params
    params.require(:subscription).permit( :start_date, :end_date, :rdv_location, :rdv_date, bunches_attributes: [:id, :name, :in_safe, :description, :number_of_items, :_destroy])
  end
end

class PaymentsController < ApplicationController
  before_action :set_subscription

    def new
    end

    def create
      @amount = @subscription.price_cents

      customer = Stripe::Customer.create(
        source: params[:stripeToken],
        email: params[:stripeEmail]
      )
      # You should store this customer id and re-use it.

      charge = Stripe::Charge.create(
        customer: customer.id,
        amount:       @amount,  # in cents
        description:  "Payment for subscription #{@subscription.id}",
        currency:     'eur'
      )

      @subscription.update(payment: charge.to_json, state: 'paid')

      redirect_to subscription_path(@subscription)

    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to new_subscription_payment_path(@subscription)
    end

  private

    def set_subscription
      @subscription = Subscription.where(state: 'pending').find(params[:subscription_id])
    end
end

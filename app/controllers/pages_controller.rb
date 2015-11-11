class PagesController < ApplicationController
  def home

  end

  def show
    redirect_to subscription_path(@subscription)

  end
end

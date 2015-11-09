class MissionsController < ApplicationController
before_action :set_booking, only: [:show, :new, :create, :edit, :update, :destroy]

  def index
    @booking = Booking.all
  end

  def show

  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = @chicken.bookings.new(booking_params)
    @booking.save
    redirect_to chicken_booking_path(@chicken, @booking)
  end

  def edit
  end

  def update
    @booking.update(booking_params)
    redirect_to bookings_path
  end

  def destroy
    @bookings.delete
    redirect_to bookings_path
  end



private

  def set_booking
    @chicken = Chicken.find(params[:chicken_id])
  end

  def booking_params
    params.require(:booking).permit(:starts_on, :ends_on, :accepted)
  end
end

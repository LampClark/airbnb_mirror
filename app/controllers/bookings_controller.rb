class BookingsController < ApplicationController
  before_action :authenticate_user!
  def index
    @bookings = current_user.bookings
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def new
    @booking = Booking.new
    @listing = Listing.find(params[:listing_id])
    @listing_id = @listing.id
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user_id = current_user.id

    if @booking.save
      redirect_to booking_path(@booking)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:listing_id, :user_id, :check_in, :check_out)
  end
end

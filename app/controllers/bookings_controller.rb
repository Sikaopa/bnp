class BookingsController < ApplicationController
  def new
    @booking = Booking.new
    @boat = Boat.find(params[:boat_id])
  end

  def create

    booking = Booking.new(booking_params)
    booking.boat = Boat.find(params[:boat_id])
    booking.user = current_user
    booking.save
    redirect_to boats_path # we need to update this to go to the user dashboard
  end

private
def booking_params
  params.require(:booking).permit(:start_date, :end_date, :boat_id)
end
end

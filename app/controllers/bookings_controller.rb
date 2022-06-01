class BookingsController < ApplicationController
  def destroy
    @booking = Booking.find(params[:boat_id]) #we need to check this why do we need to reference the boat id instead of the booking id
    @booking.destroy
    redirect_to user_path(current_user), status: :see_other
  end

  def update
    @booking = Booking.find(params[:boat_id]) #we need to check this why do we need to reference the boat id instead of the booking id
    if params[:approved]
      @booking.update(approved: true)
      redirect_to user_path(current_user), status: :see_other
    else
      redirect_to user_path(current_user), status: :see_other
    end
  end

  def new
    @booking = Booking.new
    @boat = Boat.find(params[:boat_id])
  end

  def create

    booking = Booking.new(booking_params)
    booking.boat = Boat.find(params[:boat_id])
    booking.user = current_user
    booking.save
    redirect_to user_path(current_user) # we need to update this to go to the user dashboard
  end

private
def booking_params
  params.require(:booking).permit(:start_date, :end_date, :boat_id)
end
end

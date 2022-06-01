class BookingsController < ApplicationController
  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to user_path(current_user), status: :see_other
  end

  def update
    @booking = Booking.find(params[:id])
    if params[:approved]
      @booking.update(approved: true)
      redirect_to user_path(current_user), status: :see_other
    else
      redirect_to user_path(current_user), status: :see_other
    end
  end
end

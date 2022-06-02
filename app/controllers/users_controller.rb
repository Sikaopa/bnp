class UsersController < ApplicationController
  def show
    if current_user
      @bookings = current_user.bookings
    else
      redirect_to root_path
    end
  end
end

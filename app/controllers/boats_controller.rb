class BoatsController < ApplicationController

  def index
    if params[:query].present?
      @boats = Boat.where("location ILIKE ?", "%#{params[:query]}%")
    else
      @boats = Boat.all
    end
  end

  def show
    @boat = Boat.find(params[:id])
    @booking = Booking.new
    @boats = Boat.all.sample(4)
  end

  def new
    @boat = Boat.new
  end

  def create
    @boat = Boat.new(boat_params)
    @boat.user_id = current_user.id
    if @boat.save
      redirect_to boat_path(@boat)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def boat_params
    params.require(:boat).permit(:make, :location, :image_url, :capacity, :color, :daily_rate)
  end
end

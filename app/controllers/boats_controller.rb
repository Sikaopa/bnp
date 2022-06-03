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
    @markers =
      {
        lat: @boat.geocode[0],
        lng: @boat.geocode[1]
      }
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

  def edit
    @boat = Boat.find(params[:id])
  end

  def update
    @boat = Boat.find(params[:id])
    @boat.update(boat_params)
    redirect_to boat_path(@boat)
  end

  def destroy
    @boat = Boat.find(params[:id])
    @boat.destroy
    redirect_to boats_path, status: :see_other
  end


  private

  def boat_params
    params.require(:boat).permit(:make, :location, :image_url, :capacity, :color, :daily_rate)
  end

end

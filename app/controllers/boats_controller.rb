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
  end
end

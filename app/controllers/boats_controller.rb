class BoatsController < ApplicationController

  if params[:query].present?
    @boats = Boat.where("location ILIKE ?", "%#{params[:query]}%")
  else
    @boats = Boat.all
  end
end

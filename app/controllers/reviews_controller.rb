class ReviewsController < ApplicationController
  def create
    @boat = Boat.find(params[:boat_id])
    @review = Review.new(review_params)
    @review.boat = @boat
    @review.user = current_user
    respond_to do |format|
    if @review.save
      format.html { redirect_to boat_path(@boat) }
      format.json
    else
      format.html { render "boats/show", status: :unprocessable_entity }
      format.json
    end
    end
  end

  private

  def review_params
    params.require(:review).permit(:content)
  end
end

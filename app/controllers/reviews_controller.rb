class ReviewsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_virus, only: [:new, :create]

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.user = current_user
    @review.virus = @virus

    if @review.save
      redirect_to @virus, notice: "Your review was successfully submitted."
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_virus
    @virus = Virus.find(params[:virus_id])
  end

  def review_params
    params.require(:review).permit(:rating, :comment)
  end
end

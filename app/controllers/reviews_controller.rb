class ReviewsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_virus, only: [:create]

  def create
    @review = @virus.reviews.build(review_params) # Utilisation de `build` pour associer directement au virus
    @review.user = current_user

    if @review.save
      respond_to do |format|
        format.html { redirect_to @virus, notice: "Your review was successfully submitted." } # En cas de requête HTML normale
        format.js   # Réponse AJAX (cette ligne active `create.js.erb`)
      end
    else
      respond_to do |format|
        format.html { render 'viri/show', status: :unprocessable_entity }
        format.js   # En cas d'erreur AJAX
      end
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

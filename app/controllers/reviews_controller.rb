class ReviewsController < ApplicationController

  def new
    @user = current_user
    @review = Review.new
  end

  def create
    @user = current_user
    @monster = Monster.find(params[:monster_id])
    @review = Review.new(reviews_params)
    @review.user = @user
    @review.monster = @monster

    if @review.save
      redirect_to monster_path(@monster), notice: "Review creer avec succès"
    else
      render 'monsters/show', status: :unprocessable_entity
    end
  end

  private

    def reviews_params
      params.require(:review).permit(:rating, :content)
    end
end

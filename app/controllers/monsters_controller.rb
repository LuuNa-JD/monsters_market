class MonstersController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action only: [:index, :show, :new, :create]
  before_action :find_vendor?, only: [:new, :create]

  def index
    @user = current_user
    @monsters = Monster.all

  end

  def show
    @user = current_user
    @monster = Monster.find(params[:id])
    @booking = Booking.new(user: @user, monster: @monster)
  end

  def create_review
    puts"salu"
    @new_review = @monster.reviews.build(review_params)

    if @new_review.save
      flash[:success] = "Review created successfully."
      redirect_to monster_path(@monster)
    else
      flash[:error] = "Failed to create the review."
      render 'show'
    end
  end


  def new
    @user = current_user
    @monster = Monster.new(user: @user)

  end

  def create
    @user = current_user
    @monster = Monster.new(monster_params)
    @monster.user = @user
    if @monster.save
      redirect_to monster_path(@monster)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @monster = Monster.find(params[:id])
  end

  def update
    if @monster.update(monster_params)
      redirect_to @monster
    else
      render 'edit'
    end
  end

  def destroy
    @monster.destroy
    redirect_to monsters_path
  end

  private

  def monster_params
    params.require(:monster).permit(:name, :description, :price, :photo)
  end

  def review_params
    params.require(:review).permit(:rating, :review_text)
  end

  def find_vendor?
    unless current_user.vendor
      redirect_to monsters_path
    end
  end
end

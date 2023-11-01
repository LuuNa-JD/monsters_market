class MonstersController < ApplicationController
  before_action only: [:index, :show, :new, :create]

  def index
    @user = current_user
    @monsters = Monster.all

  end

  def show
    @user = current_user
    @monster = Monster.find(params[:id])
    @booking = Booking.new(user: @user, monster: @monster)
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
end

class MonstersController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :set_monster, only: [:show, :edit, :update, :destroy]
  before_action :find_vendor?, only: [:new, :create, :edit, :update, :destroy]

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
    # @monster est déjà initialisé par set_monster
  end

  def update
    # @monster est déjà initialisé par set_monster
    if @monster.update(monster_params)
      redirect_to @monster, notice: 'Le monstre a été mis à jour avec succès.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @monster = Monster.find(params[:id])
    @monster.destroy
    redirect_to monsters_path, notice: 'Le monstre a été supprimé.'
  end
  private

  def set_monster
    @monster = Monster.find(params[:id])
  end

  def monster_params
    params.require(:monster).permit(:name, :description, :price, :photo)
  end

  def find_vendor?
    unless current_user.vendor
      redirect_to monsters_path, notice: "Vous etes pas un vendeur"
    end
  end
end

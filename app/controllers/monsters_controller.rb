class MonstersController < ApplicationController
  before_action only: [:show, :edit, :update, :destroy]

  def index
    @monsters = Monster.all
  end

  def show
    @monster = Monster.find(params[:id])
  end

  def new
    @monster = Monster.new
  end

  def create
    @monster = Monster.new(monster_params)
    if @monster.save
      redirect_to @monster
    else
      render 'new'
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
    params.require(:monster).permit(:name, :description, :price, :user_id)
  end
end

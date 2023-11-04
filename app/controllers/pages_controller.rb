class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @user = current_user
    @monsters = Monster.all.sample(5)
  end
end

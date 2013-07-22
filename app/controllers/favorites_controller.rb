class FavoritesController < ApplicationController

  def create
    # binding.pry
    current_user.favorites.create(:favorited_type => "resource", :favorited_id => params[:resource_id].slice!(9..-1))
    render :layout => false
  end

  def resources
    favs = current_user.favorites.where(:favorited_type => "resource")
    @fav_resources = []
    favs.each do |fav|
      @fav_resources << Resource.find(fav.favorited_id)
    end
    render 'favorite_resources/index'
  end
end
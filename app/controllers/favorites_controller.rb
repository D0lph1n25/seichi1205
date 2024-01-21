class FavoritesController < ApplicationController
  before_action :set_seichi

  def create
    favorite = current_user.favorites.build(seichi_id: params[:seichi_id])
    favorite.save
    respond_to do |format|
      format.js
    end
  end

  def destroy
    favorite = Favorite.find_by(seichi_id: params[:seichi_id], user_id: current_user.id)
    favorite.destroy
    respond_to do |format|
      format.js
    end
  end

    def set_seichi
      @seichi = Seichi.find(params[:seichi_id])
    end

end

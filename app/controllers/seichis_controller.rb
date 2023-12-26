class SeichisController < ApplicationController

  def index
    @seichis = Seichi.all
  end

  def new
    @seichi = Seichi.new
  end

  def create
    Seichi.create(seichi_params)
    redirect_to root_path
  end

  private
  
  def seichi_params
    params.require(:seichi).permit(:title, :introduction, :category_id, :prefecture_id, :addresses, :latitude, :longitude, :user)
  end
  
end

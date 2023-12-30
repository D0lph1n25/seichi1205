class SeichisController < ApplicationController

  def index
    @seichis = Seichi.all
  end

  def new
    @seichi = Seichi.new
  end

  def create
    @seichi = Seichi.create(seichi_params)
    if @seichi.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
  
  def seichi_params
    params.require(:seichi).permit(:title, :introduction, :category_id, :prefecture_id, :addresses, :latitude, :longitude, :image).merge(user_id: current_user.id)
  end
  
end

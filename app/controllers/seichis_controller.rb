class SeichisController < ApplicationController
  before_action :move_session, only: [:new, :edit]
  before_action :seichi_find, only: [:show, :edit, :update, :destroy]

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

  def show
    @comment = Comment.new
    @comments = @seichi.comments.includes(:user)
  end

  def edit
    if current_user.id != @seichi.user_id
      redirect_to root_path
    end
  end

  def update
    if @seichi.update(seichi_params)
      redirect_to seichi_path(@seichi.id)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if user_signed_in? && current_user.id == @seichi.user_id
      @seichi.destroy
    end
    redirect_to root_path
  end

  def search
    @seichis = Seichi.search(params[:keyword])
  end

  private
  
  def seichi_params
    params.require(:seichi).permit(:title, :introduction, :category_id, :prefecture_id, :addresses, :latitude, :longitude, :image).merge(user_id: current_user.id)
  end
  
  def move_session
    unless user_signed_in?
      redirect_to new_user_session_path
    end
  end

  def seichi_find
    @seichi = Seichi.find(params[:id])
  end

end

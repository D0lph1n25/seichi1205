class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @nickname = current_user.nickname
    @seichis = current_user.seichis
    @favorite_seichis = @user.favorite_seichis
  end

end

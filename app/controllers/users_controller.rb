class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @nickname = current_user.nickname
    @seichis = current_user.seichis
    @favorites = current_user.favorites
  end

end

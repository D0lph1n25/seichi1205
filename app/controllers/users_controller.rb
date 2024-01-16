class UsersController < ApplicationController

  def show
    @nickname = current_user.nickname
    @seichis = current_user.seichis
  end

end

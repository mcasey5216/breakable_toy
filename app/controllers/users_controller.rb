class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @checkins = Checkin.where(user_id: current_user)
  end
end

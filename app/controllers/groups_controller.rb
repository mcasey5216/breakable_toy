class GroupsController < ApplicationController
  def index
    @memberships = Membership.where(user: current_user)
  end

  def show
    @group = Group.find(params[:id])
  end
end

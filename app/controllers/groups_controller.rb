class GroupsController < ApplicationController
  def index
    @memberships = Membership.where(user: current_user)
  end
end

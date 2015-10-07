class MembershipsController < ApplicationController
  def edit
    @memberships = Membership.where(group: params[:group_id])
    @users = User.all
  end

  def update
  #   @group = Group.find(params[:id])
  #   if @group.update_attributes(membership_params)
  #     flash[:success] = "Updates Successful"
  #     redirect_to
  end
end

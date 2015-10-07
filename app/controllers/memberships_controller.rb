class MembershipsController < ApplicationController
  autocomplete :user, :email, full: true, extra_data: [:first_name]
  def index
    @group = Group.find(params[:group_id])
    @memberships = @group.memberships
    @users = User.all

  end

  def create
    @users = User.all
    @group = Group.find(params[:group_id])
    @membership = Membership.new(membership_params)
    if @membership.save
      flash[:success] = "Updates Successful"
      redirect_to group_path(@group)
    else
      flash[:alert] = "Nope"
      render :index
    end
  end

  protected

  def membership_params
    params.require(:membership).permit(:user_id).merge(group: @group)
  end
end

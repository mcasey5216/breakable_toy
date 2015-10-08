class GroupsController < ApplicationController
  def index
    @memberships = Membership.where(user: current_user)
  end

  def show
    @group = Group.find(params[:id])
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)

    if @group.save
      flash[:success] = 'Group Created'
      redirect_to group_path(@group)
    else
      flash[:alert] = @group.errors.full_messages.join(', ')
      render :new
    end
  end

  protected

  def group_params
    params.require(:group).permit(
      :name,
      :description).merge(primary_user: current_user)
  end
end

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
    @membership = Membership.new(group: @group, user: current_user)
    if @group.save
      @membership.save
      flash[:success] = 'Group Created'
      redirect_to group_path(@group)
    else
      flash[:alert] = @group.errors.full_messages.join(', ')
      @group = Group.new
      render :new
    end
  end

  def edit
    @group = Group.find(params[:id])
  end

  def update
    @group = Group.find(params[:id])
    if @group.update(group_params)
      flash[:notice] = "#{@group.name} has been updated."
      redirect_to @group
    else
      flash[:errors] = @group.errors.full_messages.join(', ')
      render :edit
    end
  end

  def destroy
    @group = Group.find(params[:id])
    if @group.destroy
      flash[:success] = "Group has been deleted."
      redirect_to @group
    else
      flash[:alert] = @group.errors.full_messages.join(', ')
      redirect_to @group
    end
  end

  protected

  def group_params
    params.require(:group).permit(
      :name,
      :description).merge(primary_user: current_user)
  end
end

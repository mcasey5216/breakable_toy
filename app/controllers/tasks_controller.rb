class TasksController < ApplicationController
  def index
    @memberships = Membership.where(user: current_user)
  end

  def show
    @task = Task.find(params[:id])
    @group = @task.group
  end

  def create
    @users = User.all
    @gtask = Group.find(params[:id])
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
    params.require(:membership).permit(:user_id).merge(group: @task.group, task: @task)
  end
end

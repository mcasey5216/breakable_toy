class MembershipsController < ApplicationController
  autocomplete :user, :email, full: true, extra_data: [:first_name]
  def index
    if params[:group_id]
      @group = Group.find(params[:group_id])
      @memberships = @group.memberships
    end
    if params[:task_id]
      @task = Task.find(params[:task_id])
      @memberships = @task.memberships
    end
    @users = User.all
  end

  def create
    @users = User.all
    if params[:group_id]
      @group = Group.find(params[:group_id])
      @membership = Membership.new(membership_params_group)
      if @membership.save
        flash[:success] = "Updates Successful"
        redirect_to group_path(@group)
      else
        flash[:alert] = "Nope"
        render :index
      end
    end
    if params[:task_id]
      @task = Task.find(params[:task_id])
      @membership = Membership.new(membership_params_task)
      if @membership.save
        flash[:success] = "Updates Successful"
        redirect_to task_path(@task)
      else
        flash[:alert] = "Nope"
        render :index
      end
    end
  end

  protected

  def membership_params_group
    params.require(:membership).permit(:user_id).merge(group: @group)
  end

  def membership_params_task
    params.require(:membership).permit(
      :user_id).merge(group: @task.group, task: @task)
  end
end

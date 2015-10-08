class TasksController < ApplicationController
  def index
    @memberships = Membership.where(user: current_user)
  end

  def show
    @task = Task.find(params[:id])
    @group = @task.group
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    @group = @task.group
    if @task.save
      flash[:success] = 'Task Created'
      redirect_to group_path(@task.group)
    else
      flash[:alert] = @task.errors.full_messages.join(', ')
      redirect_to new_group_task_path(@task.group)
    end
  end

  protected

  def task_params
    params.require(:task).permit(:title, :description, :group_id)
  end
end

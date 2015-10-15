class TasksController < ApplicationController
  def index
    @memberships = Membership.where(user: current_user)
  end

  def show
    @task = Task.find(params[:id])
    @group = @task.group
    @comment = Comment.new
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    @group = @task.group
    if @task.save
      flash[:success] = 'Task Created'
      redirect_to task_path(@task)
    else
      flash[:alert] = @task.errors.full_messages.join(', ')
      redirect_to new_group_task_path(@task.group)
    end
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    if @task.update(task_params)
      flash[:notice] = "#{@task.title} has been updated."
      redirect_to @task
    else
      flash[:errors] = @task.errors.full_messages.join(', ')
      render :edit
    end
  end

  def destroy
    @task = Task.find(params[:id])
    if @task.destroy
      flash[:success] = "Task has been deleted from #{@task.group.name}."
      redirect_to group_path(@task.group)
    else
      flash[:alert] = @task.errors.full_messages.join(', ')
      redirect_to group_path(@task.group)
    end
  end

  protected

  def task_params
    params.require(:task).permit(:title, :description, :group_id)
  end
end

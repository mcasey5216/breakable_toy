class TasksController < ApplicationController
  def index
    @memberships = Membership.where(user: current_user)
  end

  def show
    @task = Task.find(params[:id])
  end
end

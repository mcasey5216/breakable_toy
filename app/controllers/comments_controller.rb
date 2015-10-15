class CommentsController < ApplicationController
  def index
    @comments = []
    current_user.groups.each do |group|
      group.comments.each do |comment|
        @comments << comment
      end
    end
  end

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      flash[:success] = "Comment successfully posted"
      if params[:group_id]
        redirect_to group_path(params[:group_id])
      elsif params[:task_id]
        redirect_to task_path(params[:task_id])
      else params[:contact_id]
        redirect_to contact_path(params[:contact_id])
      end
    else
      flash[:alert] = @comment.errors.full_messages.join(', ')
      if params[:group_id]
        redirect_to group_path(params[:group_id])
      elsif params[:task_id]
        redirect_to task_path(params[:task_id])
      else params[:contact_id]
        redirect_to contact_path(params[:contact_id])
      end
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    flash[:success] = "The comment has been deleted."
    redirect_to comments_path
  end

  protected

  def comment_params
    params.require(:comment).permit(
      :body,
      :group_id,
      :task_id,
      :contact_id,
      :user_id
    )
  end
end

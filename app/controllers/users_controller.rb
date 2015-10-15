class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @checkins = Checkin.where(user_id: current_user)
    @comments = []
    comments = []
    memberships = Membership.where(user_id: current_user)
    memberships.each do |membership|
      comments << Comment.where(group_id: membership.group.id)
      comments << Comment.where(task_id: membership.task.id)
      membership.group.contacts.each do |contact|
        comments << Comment.where(contact_id: contact.id)
      end
    end
    comments.each do |block|
      block.each do |x|
        @comments << x
      end
    end
  end
end

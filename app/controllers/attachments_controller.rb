class AttachmentsController < ApplicationController
  def index
    @attachments = []
    current_user.groups.each do |group|
      group.attachments.each do |attachment|
        @attachments << attachment
      end
    end
  end

  def new
    @attachment = Attachment.new
  end

  def create
    @attachment = Attachment.new(attachment_params)
    if @attachment.save
      flash[:success] = "Attachment successfully uploaded"
      redirect_to attachments_path
    else
      flash[:alert] = @attachment.errors.full_messages.join(', ')
      redirect_to attachments_path
    end
  end

  def destroy
    @attachment = Attachment.find(params[:id])
    @attachment.destroy
    redirect_to attachments_path, notice:  "The attachment #{@attachment.name} has been deleted."
  end

  protected
  def attachment_params
    params.require(:attachment).permit(:name, :attachment, :group_id)
  end
end

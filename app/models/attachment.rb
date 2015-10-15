class Attachment < ActiveRecord::Base
  belongs_to :group

  mount_uploader :attachment, AttachmentUploader
  validates :attachment, presence: true
  validates :name, presence: true
  validates :group, presence: true
end

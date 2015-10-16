class AddDescriptionToAttachments < ActiveRecord::Migration
  def change
    add_column :attachments, :description, :string
  end
end

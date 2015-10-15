class CreateAttachments < ActiveRecord::Migration
  def change
    create_table :attachments do |t|
      t.string :name, null: false
      t.string :attachment, null: false
      t.belongs_to :group, null: false

      t.timestamps null: false
    end
  end
end

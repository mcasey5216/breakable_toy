class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :body, null: false
      t.belongs_to :user, null: false
      t.belongs_to :group
      t.belongs_to :task
      t.belongs_to :contact

      t.timestamps null: false
    end
  end
end

class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.belongs_to :group, null: false
      t.string :title, null: false
      t.string :description, null: false
      t.boolean :completed, default: false

      t.timestamps null: false
    end
  end
end

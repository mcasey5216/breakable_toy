class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.string :name, null: :false
      t.integer :primary_user_id, null: false
      t.string :description, null: false
    end
  end
end

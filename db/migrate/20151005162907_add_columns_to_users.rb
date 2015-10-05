class AddColumnsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :first_name, :string, null: false
    add_column :users, :last_name, :string, null: false
    add_column :users, :title, :string
    add_column :users, :address, :string
    add_column :users, :city, :string, null: false
    add_column :users, :state, :string, null: false
    add_column :users, :zip, :string, null: false
    add_column :users, :phone, :string, null: false
  end
end

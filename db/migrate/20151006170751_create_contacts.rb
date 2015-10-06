class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.belongs_to :group, null: false
      t.string :email, null: false
      t.string :company_name
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :address, null: false
      t.string :city, null: false
      t.string :state, null: false
      t.string :zip, null: false
      t.integer :phone
      t.string :phone_ext
      t.string :category
      t.string :description
    end
  end
end

class ChangePhoneTypeInContacts < ActiveRecord::Migration
  def change
    def up
      change_column :contacts, :phone, :string
    end

    def down 
      change_column :contacts, :phone, :integer
    end
  end
end

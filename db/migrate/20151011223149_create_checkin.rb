class CreateCheckin < ActiveRecord::Migration
  def change
    create_table :checkins do |t|
      t.float :latitude, null: false
      t.float :longitude, null: false
      t.belongs_to :user, null: false
      t.belongs_to :contact
      t.string :message

      t.timestamps null: false
    end
  end
end

class Contact < ActiveRecord::Base
  belongs_to :group

  validates :email, format:
    { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :address, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :state, length: { is: 2 }
  validates :zip, presence: true
  validates :zip, length: { is: 5 }
  validates :phone, length: { is: 10 }
end

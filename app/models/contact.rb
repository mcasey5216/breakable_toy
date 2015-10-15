class Contact < ActiveRecord::Base
  belongs_to :group
  has_many :checkins, dependent: :destroy
  has_many :comments, dependent: :destroy

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

  def geo_address
    [address, city, state, zip].join(", ")
  end

  def display_address
    a = [address, city].join(" | ")
    b = [a, state].join(", ")
    [b, zip].join(" | ")
  end

  def display_phone
    ph = phone.to_s.split('')
    [
      ph[0..2].join(''),
      ph[3..5].join(''),
      ph[6..9].join('')
    ].join(".") + " | ext " + phone_ext
  end

  def name
    [first_name, last_name].join(" ")
  end
  geocoded_by :geo_address
  after_validation :geocode, if: :address_changed?
end

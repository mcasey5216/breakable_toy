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

  def geo_address
    [self.address, self.city, self.state, self.zip].reject(&:empty?).join(" ")
  end

  def display_address
    a = [self.address, self.city].join(" | ")
    b = [a, self.state].join(", ")
    [b, self.zip].join(" | ")
  end

  def display_phone
    phone = self.phone.to_s.split('')
    [phone[0..2].join(''),
    phone[3..5].join(''),
    phone[6..9].join('')].join(".") + " | ext " + self.phone_ext
  end

  def name
    [self.first_name, self.last_name].join(" ")
  end

  geocoded_by :geo_address
  after_validation :geocode, if: :address_changed?
end

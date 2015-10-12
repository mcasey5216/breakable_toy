class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :primaries, class_name: 'Group', foreign_key: 'primary_user_id'
  has_many :memberships, dependent: :destroy
  has_many :groups, through: :memberships, dependent: :destroy
  has_many :tasks, through: :memberships, dependent: :destroy
  has_many :checkins, dependent: :destroy

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :state, length: { is: 2 }
  validates :zip, presence: true
  validates :zip, length: { is: 5 }
  validates :phone, presence: true

  def display_address
    a = [address, city].join(" | ")
    b = [a, state].join(", ")
    [b, zip].join(" | ")
  end

  def name
    [first_name, last_name].join(" ")
  end

  def display_phone
    ph = phone.to_s.split('')
    [
      ph[0..2].join(''),
      ph[3..5].join(''),
      ph[6..9].join('')
    ].join(".")
  end

  def last
    l = last_sign_in_at
    [l.month, l.day, l.year].join(".") + " at " + [l.hour, l.min].join(":")
  end
end

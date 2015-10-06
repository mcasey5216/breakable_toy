class Group < ActiveRecord::Base
  belongs_to :primary_user, class_name: 'User'
  has_many :memberships
  has_many :users, through: :memberships
  has_many :tasks, through: :memberships

  validates :name, presence: true
  validates :description, presence: true
  validates :primary_user, presence: true
end

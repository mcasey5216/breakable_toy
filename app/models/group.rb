class Group < ActiveRecord::Base
  belongs_to :primary_user, class_name: 'User'
  has_many :memberships
  has_many :memberships, through: :users
end

class Group < ActiveRecord::Base
  belongs_to :primary_user, class_name: 'User'
  has_many :contacts, dependent: :destroy
  has_many :memberships, dependent: :destroy
  has_many :users, through: :memberships, dependent: :destroy
  has_many :tasks
  has_many :attachments

  validates :name, presence: true
  validates :description, presence: true
  validates :primary_user, presence: true
end

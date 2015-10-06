class Task < ActiveRecord::Base
  belongs_to :group
  has_many :memberships
  has_many :users, through: :memberships

  validates :title, presence: true
  validates :description, presence: true
  validates :group, presence: true
end

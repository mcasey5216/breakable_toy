class Task < ActiveRecord::Base
  belongs_to :group
  has_many :memberships, dependent: :destroy
  has_many :users, through: :memberships, dependent: :destroy

  validates :title, presence: true
  validates :description, presence: true
  validates :group, presence: true
end

class Membership < ActiveRecord::Base
  belongs_to :user
  belongs_to :group
  belongs_to :task

  validates :user, presence: true
  validates :group, presence: true
end

class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :group
  belongs_to :task
  belongs_to :contact

  validates :body, presence: true
  validates :user, presence: true

  def when
    l = created_at
    [l.month, l.day, l.year].join(".") + " at " + [l.hour, l.min].join(":")
  end
end

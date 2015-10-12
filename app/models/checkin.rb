class Checkin < ActiveRecord::Base
  belongs_to :user
  belongs_to :contact

  validates :user, presence: true

  def when
    l = created_at
    [l.month, l.day, l.year].join(".") + " at " + [l.hour, l.min].join(":")
  end
  reverse_geocoded_by :latitude, :longitude
  after_validation :geocode

  def address
    Geocoder.address([latitude, longitude])
  end
end

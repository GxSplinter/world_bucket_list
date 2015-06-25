class Todo < ActiveRecord::Base
  belongs_to :destination

  geocoded_by :location
  after_validation :geocode, :if => lambda{ |obj| obj.location_changed? }

  validates_presence_of :details
  validates_presence_of :location
end

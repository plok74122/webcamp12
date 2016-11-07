class Event < ApplicationRecord
  validates_presence_of :name , :description

  has_many :attendees
  has_many :event_groupships
  has_one :location
end

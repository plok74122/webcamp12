class Event < ApplicationRecord
  validates_presence_of :name , :description

  has_many :attendees
end

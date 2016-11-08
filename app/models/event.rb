class Event < ApplicationRecord
  validates_presence_of :name, :description
  has_many :attendees, :dependent => :nullify
  has_many :event_groupships, :dependent => :destroy
  has_many :groups, :through => :event_groupships, :dependent => :destroy
  has_one :location, :dependent => :destroy
  belongs_to :category

  delegate :name, :to => :category, :prefix => true , :allow_nil => true
end

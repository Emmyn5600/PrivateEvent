class Event < ApplicationRecord
  belongs_to 	:creator, :class_name => "User"

	has_many 	:event_attendees, :foreign_key => :attended_event_id
  has_many 	:attendees, :through => :event_attendees

  scope :upcoming, -> { where("Date >= ?", Date.today).order('Date ASC') }
	scope :past, 	 -> { where("Date <  ?", Date.today).order('Date DESC') }

	validates  :location, length: { minumum: 5, maximum: 100 }
	validates  :description, length: { minumum: 5, maximum: 500 }
end

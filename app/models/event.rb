class Event < ApplicationRecord
  belongs_to 	:creator, :class_name => "User"

  has_many 	:event_attendees, :foreign_key => :attended_event_id
  has_many 	:attendees, :through => :event_attendees

  scope :upcoming, -> { where("Date >= ?", Date.today).order('Date ASC') }
  scope :past, 	 -> { where("Date <  ?", Date.today).order('Date DESC') }

	validates  :title, presence: true, length: { minumum: 5, maximum: 50 }
	validates  :description, presence: true, length: { minumum: 5, maximum: 999 }
	validates  :location, presence: true, length: { minumum: 5, maximum: 100 }
end

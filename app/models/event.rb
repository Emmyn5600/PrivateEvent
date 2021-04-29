class Event < ApplicationRecord
  belongs_to :user, class_name: "User"
  validates :title, :description, :date_time, :location, presence: true
  has_many :evuser, foreign_key: :attended_event_id
  has_many :attendees, through: :evuser

  scope :past, -> { where('date_time < ?', Date.today).order(date_time: :desc) }
  scope :future, -> { where('date_time > ?', Date.today).order(:date_time) }
end

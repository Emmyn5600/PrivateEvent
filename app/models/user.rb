class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :events, :foreign_key => :creator_id

  has_many :attended_events,  :through => :event_attendees
	has_many :event_attendees,  :foreign_key => :attendee_id

  validates :username, length: { maximum: 50 }, uniqueness: { case_sensitive: false }

  def attending?(event)
    event.attendees.include?(self)
  end
  
  def attend!(event)
    self.event_attendees.create!(attended_event_id: event.id)
  end
  
  def cancel!(event)
    self.event_attendees.find_by(attended_event_id: event.id).destroy
  end
end

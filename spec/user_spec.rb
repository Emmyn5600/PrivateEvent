require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Associations' do
    it { should have_many(:attended_events) }
    it { should have_many(:event_attendees) }
    it { should have_many(:created_events) }
  end
end
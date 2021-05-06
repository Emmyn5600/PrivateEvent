require 'rails_helper'

RSpec.describe Event, type: :model do
  describe 'Associations' do
    it { should have_many(:event_attendees) }
    it { should have_many(:attendees) }
    it { should belong_to(:creator).class_name('User') }
  end
end

RSpec.describe Event, type: :model do
  subject do
    User.create(id: 8, name: 'Foo', username: 'foozin', email: 'foo@zin.com', password: '123456')
    Event.new(title: 'Anything',
              description: 'Lorem ipsum',
              date: DateTime.now,
              location: 'USA',
              creator_id: 8)
  end

  it 'is valid with name, description, date, location and a creator_id(user logged in)' do
    expect(subject).to be_valid
  end

  it 'is not valid without a name' do
    subject.title = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without minimum of 5 characters in description' do
    subject.description = 'hey'
    expect(subject).to_not be_valid
  end

  it 'is not valid without a description' do
    subject.description = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without a date' do
    subject.date = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without a location' do
    subject.location = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without a creator_id logged in' do
    subject.creator_id = 100
    expect(subject).to_not be_valid
  end
end

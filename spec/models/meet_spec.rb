require 'rails_helper'

RSpec.describe Meet, type: :model do
  subject do
    described_class.new(meet_date: Date.today,
                        meet_type: Meet::MEET_TYPES[:HUT],
                        location: 'Some place',
                        places: 6,
                        number_of_nights: 2)
  end
  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end
  it 'is not valid without a meet_date' do
    subject.meet_date = nil
    expect(subject).to_not be_valid
  end
  it 'is not valid without a meet_type in MEET_TYPES' do
    subject.meet_type = 'not meet_type'
    expect(subject).to_not be_valid
  end
  it 'is not valid without a location' do
    subject.location = nil
    expect(subject).to_not be_valid
  end
  it 'is not valid if number_of_nights is not an integer' do
    subject.number_of_nights = 'string'
    expect(subject).to_not be_valid
  end
  it 'is not valid if places is not an integer' do
    subject.places = 'string'
    expect(subject).to_not be_valid
  end
end

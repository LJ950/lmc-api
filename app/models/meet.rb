class Meet < ApplicationRecord
  has_many :attendees, dependent: :destroy
  has_many :members, through: :attendees

  # after_save :reset_status

  accepts_nested_attributes_for :attendees

  MEET_TYPES = { HUT: 'hut', CAMPING: 'camping', DAY: 'day', EVENING: 'evening' }

  validates :meet_date, presence: true
  validates :meet_type, presence: true, inclusion: { in: MEET_TYPES.values }
  validates :location, presence: true, length: { maximum: 200 }
  validates :places, numericality: { only_integer: true, allow_nil: true }
  validates :number_of_nights, numericality: { only_integer: true, allow_nil: true }
end

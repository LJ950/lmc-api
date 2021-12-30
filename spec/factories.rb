FactoryBot.define do
  factory :meet do
    # trait :hut do
    meet_date { 2.months.from_now }
    meet_type { 'hut' }
    number_of_nights { 2 }
    places { 6 }
    opens_on { 1.month.from_now }
    # end

    # trait :evening do
    #   meet_type { 'Evening' }
    # meet_date { 1.months.from_now }
    # activity { 'climbing' }
    # end

    location { 'Some place' }
    bb_url { 'www.testurl.com' }
    notes { 'some notes here' }
  end
end

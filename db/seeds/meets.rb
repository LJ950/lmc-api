# Meet1 - hut - open
Meet.create!(
  meet_date: 10.days.from_now,
  meet_type: 'Hut',
  number_of_nights: 2,
  places: 12,
  location: 'Ingleton, Yorkshire Dales',
  bb_url: 'www.bburl2.com',
  opens_on: 20.days.ago
)

# Meet2 - camping - open
Meet.create!(
  meet_date: 20.days.from_now,
  meet_type: 'Camping',
  number_of_nights: 2,
  location: "Ty'n Lon, Nant Peris, Snowdonia",
  bb_url: 'www.bburl12.com',
  notes: 'some notes',
  opens_on: 10.days.ago
)

# Meet3 - day - full
Meet.create!(
  meet_date: 2.days.from_now,
  meet_type: 'Day',
  number_of_nights: 2,
  places: 4,
  location: 'Some walk somewhere',
  bb_url: 'www.bburl.com',
  opens_on: -28.days.ago
)

# Meet4 - evening - open
Meet.create!(
  meet_date: 26.days.from_now,
  meet_type: 'Evening',
  location: 'Leeds Wall',
  activity: 'climb'
)

# Meet5 - day
Meet.create!(
  meet_date: 57.days.from_now,
  meet_type: 'Day',
  location: 'Pen y Ghent, Yorkshire Dates',
  bb_url: 'www.bburl4.com',
  notes: 'Meet at Horton in Ribblesdale at 10am',
  activity: 'walk',
  opens_on: 27.days.from_now
)

# Meet6
Meet.create!(
  meet_date: 67.days.from_now,
  meet_type: 'Hut',
  number_of_nights: 2,
  places: 16,
  location: 'K Shoes, Borrowdale',
  opens_on: 37.days.from_now
)

# Meet7
Meet.create!(
  meet_date: 97.days.from_now,
  meet_type: 'Hut',
  number_of_nights: 4,
  places: 10,
  location: 'Kinlochewe Hotel Bunkhouse, nr. Torridon, Northwest Highlands, Scotland',
  opens_on: 67.days.from_now
)

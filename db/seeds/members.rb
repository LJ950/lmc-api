member1 = Member.create!(
  first_name: 'Luke',
  last_name: 'Test',
  address_1: '11 Street',
  address_2: '',
  address_3: '',
  town: 'Leeds',
  postcode: 'LS19 9QR',
  county: 'West Yorkshire',
  country: 'United Kingdom',
  home_phone: '01234567894',
  email: 'luke@test.com',
  dob: DateTime.new(1987, 12, 8).strftime,
  experience: 'Climbing stuff',
  accept_risks: true,
  receive_emails: true,
  firebase_id: 'eq4KFnUYsqhOAKnR0JdHq8FhBMI2'
)

# member1.membership.update(
#   bmc_number: '654984',
#   membership_type: 'Full',
#   fees_received_on: DateTime.new(2022, 1, 8).strftime,
#   welcome_pack_sent: true,
#   made_full_member: DateTime.new(2014, 3, 12).strftime,
#   committee_position: 'Social Secretary',
#   subs_paid: true,
#   notes: 'Some notes'
# )

# member1.emergency_contact.update(
#   name: 'Emergency Contact',
#   address_1: 'Some street',
#   address_2: '',
#   address_3: '',
#   town: 'Town',
#   postcode: 'QW12 1QW',
#   country: 'United Kingdom',
#   primary_phone: '012345678910',
#   secondary_phone: '',
#   relationship: 'Family'
# )

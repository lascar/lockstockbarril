FactoryGirl.define do
  factory :address do
    street {Faker::Name.name}
    street_number {Faker::Name.name}
    additional_information {Faker::Name.name}
    zipcode {Faker::Name.name}
    town {Faker::Name.name}
    state {Faker::Name.name}
    country {Faker::Name.name}
  end
end


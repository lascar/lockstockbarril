FactoryGirl.define do
  factory :warehouse do
    name {Faker::Name.name}
    capacity 1000
  end

end

FactoryGirl.define do
  factory :brand do
    name {Faker::Name.name}
  end

  factory :brand_invalid_request, class: Brand do
    name nil
  end
end

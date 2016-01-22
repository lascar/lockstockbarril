FactoryGirl.define do
  factory :brand do
    sequence(:name) { |n| "name#{n}" }
  end

  factory :brand_invalid_request, class: Brand do
    name nil
  end
end

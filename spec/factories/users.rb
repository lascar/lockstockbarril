FactoryGirl.define do
  factory :user do
    name {Faker::Name.name}
    email { Faker::Internet.email }
  end

  factory :user_invalid_request, class: User do
    name {Faker::Name.name}
    email nil
  end
end

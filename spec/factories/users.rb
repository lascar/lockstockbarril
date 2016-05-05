FactoryGirl.define do
  factory :user do
    name {Faker::Name.name}
    email { Faker::Internet.email }
    user_secret { Faker::Internet.password(14) }
    server_secret { Faker::Internet.password(14) }
  end

  factory :user_invalid_request, class: User do
    name {Faker::Name.name}
    email nil
  end
end

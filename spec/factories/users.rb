FactoryGirl.define do
  factory :user do
    name {Faker::Name.name}
    email { Faker::Internet.email }
    password 'password'
    password_confirmation 'password'
  end

  factory :user_invalid_request, class: User do
    email nil
  end
end

FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "username#{n}@mail.com" }
    password 'password'
  end

  factory :user_invalid_request, class: User do
    email nil
  end
end

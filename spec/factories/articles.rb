FactoryGirl.define do
  factory :article do
    reference {Faker::Name.name}
    brand
  end

  factory :article_invalid_request, class: Article do
    reference nil
  end
end

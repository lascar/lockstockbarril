FactoryGirl.define do
  factory :article do
    sequence(:reference) { |n| "reference#{n}" }
    brand
  end

  factory :article_invalid_request, class: Article do
    reference nil
  end
end

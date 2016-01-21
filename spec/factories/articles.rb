FactoryGirl.define do
  factory :article do
    sequence(:reference) { |n| "reference#{n}" }
  end

  factory :article_invalid_request, class: Article do
    reference nil
  end
end

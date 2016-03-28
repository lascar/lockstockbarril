FactoryGirl.define do
  factory :supply_in_warehouse do
    article do
      association :article
    end
    supply nil
    location nil
    bought_price 1
    quantity 1
  end

end

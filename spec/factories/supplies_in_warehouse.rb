FactoryGirl.define do
  factory :supply_in_warehouse do
    association :article
    supply
    location nil
    bought_price 1
    quantity 1
  end

end

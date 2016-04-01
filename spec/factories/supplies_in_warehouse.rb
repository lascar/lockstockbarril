FactoryGirl.define do
  factory :supply_in_warehouse do
    association :warehouse
    association :article
    supply
    location nil
    bought_price_unit 1
    quantity 1
  end

end

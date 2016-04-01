FactoryGirl.define do
  factory :supply do
    ref_supplier 'ref_supplier'
    price 10
    association :article
    association :supplier
  end

end

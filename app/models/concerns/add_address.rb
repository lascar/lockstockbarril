# addressable, add an addres
module AddAddress
  extend ActiveSupport::Concern
  included do
    has_one :address, as: :addresseable, dependent: :destroy
    accepts_nested_attributes_for :address
  end
end

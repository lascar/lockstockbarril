# addressable, add an addres
module AddAddress
  extend ActiveSupport::Concern
  included do
    has_one :address, as: :addresseable, dependent: :destroy
    accepts_nested_attributes_for :address

    after_save :add_address_if_none
  end

  private
  def add_address_if_none
    unless address
      Address.create(addresseable_id: id, addresseable_type: self.class.name)
    end
  end
end

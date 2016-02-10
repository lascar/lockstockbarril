# addressable, add an addres
module AddAddress
  extend ActiveSupport::Concern
  included do
    has_one :address, as: :addresseable, dependent: :destroy
    accepts_nested_attributes_for :address
    after_save :add_address
  end

  private

  def add_address
    Address.create(addresseable_id: self.id, addresseable_type: self.class.name)
  end
end

class Stock < ActiveRecord::Base
  has_one :address, as: :addresseable, dependent: :destroy
  has_many :locations
  accepts_nested_attributes_for :address
end

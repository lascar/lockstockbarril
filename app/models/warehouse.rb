class Warehouse < ApplicationRecord
  include AddAddress
  has_many :locations
  has_many :supplies_in_warehouse
end

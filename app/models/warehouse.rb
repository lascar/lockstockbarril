class Warehouse < ActiveRecord::Base
  include AddAddress
  has_many :locations
  has_many :supplies_in_warehouse
end

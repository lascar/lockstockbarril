class Stock < ActiveRecord::Base
  include AddAddress
  has_many :locations
end

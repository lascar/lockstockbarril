class Supplier < ApplicationRecord
  include AddAddress
  has_many :articles, through: :supplies, dependent: :destroy
  has_many :supplies, dependent: :destroy
  accepts_nested_attributes_for :supplies
  accepts_nested_attributes_for :address
end

class SupplyInWarehouse < ActiveRecord::Base
  include ActiveModel::Validations
  belongs_to :warehouse
  belongs_to :article
  belongs_to :supply
  belongs_to :location

  validates_associated :warehouse
  validates_presence_of :warehouse
  validates_associated :article
  validates_presence_of :article
  validates_associated :supply
  validates_associated :location

  validates_with EnsureExists, type: :warehouse, attribute_id: 'warehouse_id'
  validates_with EnsureExists, type: :supply, attribute_id: 'supply_id'
end

class SupplyInWarehouse < ActiveRecord::Base
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
end

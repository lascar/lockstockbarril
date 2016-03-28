class SupplyInWarehouse < ActiveRecord::Base
  belongs_to :article
  belongs_to :supply
  belongs_to :location

  validates_associated :article
  validates_presence_of :article
end

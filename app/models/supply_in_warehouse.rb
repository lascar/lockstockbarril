class SupplyInWarehouse < ActiveRecord::Base
  include ActiveModel::Validations
  belongs_to :warehouse
  belongs_to :article
  belongs_to :supply
  belongs_to :location

  validates_associated :warehouse
  validates_presence_of :warehouse
  validates_associated :supply
  validates_associated :location

  validates_with EnsureExists, type: :warehouse, attribute_id: 'warehouse_id'
  validates_with EnsureExists, type: :supply, attribute_id: 'supply_id'
  
  before_save :put_article

  private

  def put_article
    supply = Supply.find supply_id
    self.article_id = supply.article.id
  end
end

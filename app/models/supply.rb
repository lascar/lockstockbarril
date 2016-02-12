class Supply < ActiveRecord::Base
  belongs_to :article, inverse_of: :supplies
  belongs_to :supplier, inverse_of: :supplies
  validates_uniqueness_of :ref_supplier, scope: :supplier_id
  validates :price, numericality: { greater_than_or_equal_to: 0 }, presence: true
end

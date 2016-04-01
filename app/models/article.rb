# Article is the gender of supply and supply_in_warehouse
class Article < ActiveRecord::Base
  validates_presence_of :reference
  validates_uniqueness_of :reference, scope: :brand_id
  belongs_to :brand
  has_many :suppliers, through: :supplies
  has_many :supplies, dependent: :destroy
  has_many :supplies, dependent: :destroy
  accepts_nested_attributes_for :supplies, allow_destroy: true

  def self.as_reference(reference)
    Article.where("reference ilike ?", "%#{reference}%")
  end

  def self.as_brand_name(brand)
    brands = Brand.filter_by_name(brand)
    Article.where{brand_id.in(brands.select{id})}
  end
end

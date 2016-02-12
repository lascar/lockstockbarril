class Article < ActiveRecord::Base
  validates_presence_of :reference
  validates_uniqueness_of :reference, scope: :brand_id
  belongs_to :brand
  has_many :suppliers, through: :supplies
  has_many :supplies, dependent: :destroy
  accepts_nested_attributes_for :supplies, allow_destroy: true

  def self.filter_by_reference(ref)
     where{(lower(reference) =~ "%#{ref.downcase}%")}
  end

  def self.filter_by_brand(brand)
    brands = Brand.filter_by_name(brand)
    Article.where{brand_id.in(brands.select{id})}
  end
end

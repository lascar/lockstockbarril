class Article < ActiveRecord::Base
  validates_presence_of :reference
  validates_uniqueness_of :reference, scope: :brand_id
  belongs_to :brand
  has_many :suppliers, through: :supplies
  has_many :supplies, dependent: :destroy
  accepts_nested_attributes_for :supplies, allow_destroy: true
end

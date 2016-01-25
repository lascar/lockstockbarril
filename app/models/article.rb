class Article < ActiveRecord::Base
  validates_presence_of :reference
  validates_uniqueness_of :reference, scope: :brand_id
  belongs_to :brand
end

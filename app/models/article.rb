class Article < ActiveRecord::Base
  validates_presence_of :reference
  belongs_to :brand
end

class Address < ApplicationRecord
  belongs_to :addresseable, polymorphic: true
end

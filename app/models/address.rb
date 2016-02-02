class Address < ActiveRecord::Base
  belongs_to :addresseable, :polymorphic => true
end

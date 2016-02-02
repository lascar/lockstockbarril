class Supply < ActiveRecord::Base
  belongs_to :article
  belongs_to :supplier
end

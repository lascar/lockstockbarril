# brand is the gender of article
class Brand < ApplicationRecord
  validates_presence_of :name

  def self.filter_by_name(str)
    where('name LIKE ?', "%#{str.downcase}%")
  end
end

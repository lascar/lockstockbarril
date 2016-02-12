class Brand < ActiveRecord::Base
  validates_presence_of :name

  def self.filter_by_name(str)
     where{(lower(name) =~ "%#{str.downcase}%")}
  end
end

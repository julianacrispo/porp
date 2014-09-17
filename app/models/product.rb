class Product < ActiveRecord::Base
  has_many :uses

  def self.search(query)
    where("name like ?", "%#{query}%") #todo: autopop and return not exact searches
  end
end

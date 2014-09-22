class Product < ActiveRecord::Base
  has_many :uses
  has_many :users

  def self.search(query)
    where("name like ?", "%#{query}%") #todo: autopop and return not exact searches
  end
end

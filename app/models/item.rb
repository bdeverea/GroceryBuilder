class Item < ActiveRecord::Base
  has_many :ingredients
  has_many :recipes, :through => :ingredients
  
  validates_presence_of :name
  validates_uniqueness_of :name, :if => Proc.new { |item| !item.name.blank? }
  
  
end

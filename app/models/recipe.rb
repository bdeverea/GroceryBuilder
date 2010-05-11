class Recipe < ActiveRecord::Base
  has_many :ingredients
  has_many :items, :through => :ingredients
  
  validates_presence_of :name
  validates_uniqueness_of :name, :if => Proc.new { |recipe| !recipe.name.blank? }  
end

class Ingredient < ActiveRecord::Base
  belongs_to :item
  belongs_to :recipe
                    
  validates :item_id, :recipe_id, :quantity, :presence => true 
end

require 'test_helper'
require 'factories/ingredient'
require 'factories/item'
require 'factories/recipe'

class IngredientTest < ActiveSupport::TestCase
  context "creating a new ingredient" do
    setup do
      @item = Factory.create(:flour)
      @recipe = Factory.create(:cake_recipe)
      @ingredient = Ingredient.new
      @ingredient.item_id = @item
      @ingredient.recipe_id = @recipe
      @ingredient.save
    end
    
    subject { @ingredient }
    
    should_belong_to :item
    should_belong_to :recipe
    # TODO: Check back for compatability when Rails 3 is released
    # should_validate_presence_of :recipe_id, :item_id, :quantity 
    
    should "have some state" do
      assert @ingredient.respond_to?(:item_id)
      assert @ingredient.respond_to?(:recipe_id)
      assert @ingredient.respond_to?(:unit)
      assert @ingredient.respond_to?(:quantity)
    end
    
    should "have a quantity assigned" do
      assert_raise(ActiveRecord::RecordInvalid) do 
        Factory.create(:cup_of_flour, :quantity => "")
      end
      
      cup_of_flour = Factory.build(:cup_of_flour, :quantity => "")
      assert cup_of_flour.invalid? 
      assert cup_of_flour.errors[:quantity].any?
      assert_equal cup_of_flour.errors[:quantity].to_s, "can't be blank"
      
    end
  end
  
  context "with an existing ingredient" do
    setup do
      
    end
    
  end
  
end
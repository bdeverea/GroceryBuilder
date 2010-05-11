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
    
    should "have a name" do
      assert_raise(ActiveRecord::RecordInvalid) do 
        Factory.create(:flour, :name => "")
      end
      
      flour = Factory.build(:flour)
      assert flour.invalid? 
      assert flour.errors[:name].any?
      assert_equal flour.errors[:name].to_s, "has already been taken"
      
    end
    
    should "have a unique name" do
      assert_raise(ActiveRecord::RecordInvalid) do 
        Factory.create(:flour)
      end
    end
  end
  
  context "an existing ingredient" do
    setup do
      
    end
    
    should "have an item" do
    end
    
    should "have belong to a recipe" do
    end
    
  end
  
end
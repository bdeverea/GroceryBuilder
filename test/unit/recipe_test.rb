require 'test_helper'
require 'factories/recipe'

class RecipeTest < ActiveSupport::TestCase

  context "with a user" do
    setup do
      @cake = Factory(:cake_recipe)
    end
    
    # should_validate_presence_of :name
    should_validate_uniqueness_of :name
    
    should "be able to create a recipe" do
      assert Factory.create(:cake_recipe, :name => rand(3).to_s)
    end
    
    should "not be able to create a recipe without a name" do
      assert_raise(ActiveRecord::RecordInvalid) do 
        Factory.create(:cake_recipe, :name => "")
      end
    end
  end
  
  context "with a recipe" do 
    setup do
      @cake = Factory.build(:cake_recipe)
    end
    
    should "create an item" do
      assert_equal @cake.ingredient.item.id, "1"
    end
    
    should "create an ingredient" do
      
    end
  end
  
end

require 'test_helper'
require 'factories/item'

class ItemTest < ActiveSupport::TestCase
  
  context "with a user" do
    setup do
      @flour = Factory(:flour)
    end
    
    # should_validate_presence_of :name
    should_validate_uniqueness_of :name
    
    should "be able to create an item" do
      assert Factory.create(:flour, :name => rand(3).to_s)
    end
    
    should "not be able to create a recipe without a name" do
      assert_raise(ActiveRecord::RecordInvalid) do 
        Factory.create(:flour, :name => "")
      end
    end
  end
end

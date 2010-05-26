require 'test_helper'
require 'factories/ingredient'
require 'factories/item'
require 'factories/recipe'


class IngredientParserTest < ActiveSupport::TestCase

  context "with a list of ingredients" do
    setup do
      str = "1 (8 ounce) package angel hair pasta
      2.5 cups (8 ounce) package angel hair pasta
      1/2 clove (8 ounce) package angel hair pasta"
      
      @parser = IngredientParser.new
      @result = @parser.parse(str)
    end
    
    subject { @ingredient }
    
    should "parse and return an Array of items, units and quantities" do            
      assert_equal Array, @result.class
      
      @result.each do | key |
        assert "#{key[0]}".to_i #assert that the first item in the array is a positive number
        assert "#{key[1]}" == "" || "#{key[1]}" == "cup" || "#{key[1]}" == "clove"
        assert_equal "(8 ounce) package angel hair pasta",  "#{key[2]}"        
      end
    end
    
    should "throw an error when passed an integer" do
      num = 12345
      assert_raise TypeError do
         @parser.parse(num)
       end
    end
    
    
  end
  
end
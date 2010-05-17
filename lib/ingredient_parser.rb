class IngredientParser
  def initialize
    @pat = /(\d+)\s(ounce|oz|cup)/
  end
  
  def parse(str)
    @pat.match(str)
  end
  
end



str = "1 (8 ounce) package angel hair pasta
1/2 cup butter
4 cloves minced garlic
1 pound shrimp, peeled and deveined
1 cup dry white wine
1/4 teaspoon ground black pepper
3/4 cup grated Parmesan cheese
1 tablespoon chopped fresh parsley"

parser = IngredientParser.new
puts parser.parse(str)
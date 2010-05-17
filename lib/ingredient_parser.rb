class IngredientParser
  def initialize
    @pat = /(\d+)(\s+|\/\d+\s+)(ounce|oz|cup|pound|teaspoon|tablespoon|slice|clove)*/
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
1 tablespoon chopped fresh parsley
6 cups romaine lettuce
1/2 small red onion, diced
3/4 cup grape tomatoes, cut in half
3 slices Wonder® Classic White Bread
1/2 cup light mayonnaise
1 tablespoon lemon juice
1 clove garlic, minced
1/4 teaspoon seasoned salt
6 slices bacon, cooked crisp and crumbled
3 cups all-purpose flour
2 cups white sugar
3 teaspoons baking soda
6 tablespoons unsweetened cocoa powder
1 teaspoon salt
2/3 cup vegetable oil
3 tablespoons distilled white vinegar
2 teaspoons vanilla extract
2 cups water
1/2 cup butter, softened
1/2 cup shortening
2/3 cup milk
1 teaspoon vanilla extract
1 cup white sugar"

parser = IngredientParser.new
puts parser.parse(str)

str.lines do |s| 
  s.each do 
    puts parser.parse(s)
  end
end
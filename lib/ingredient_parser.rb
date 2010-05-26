class IngredientParser
  def initialize
    # INGREDIENT PARSER REGEX
    # $1 one or more digits at the start of the line
    # $2 one or zero occurences of one or zero /'s OR .'s OR space 
    # $3 one or zero occurences of one or more digits
      # $1 + $2 + $3 = total quantity of ingredient (i.e. "4" or "1/2" or "1.5")
    # space
    # $4 one or zero occurences of any characters surrounded by parenthesis = item description (i.e. "(8 ounce package)") 
    # $5 one or zero occurences of a specific unit of measure = unit
    # $6 one or zero "s" to remove plurarility from unit OR one or more spaces (currently not used in return value)
    # $7 one or more characters = item
    @pat = /(^\d+)(\.|\/|\s)?(\d+)? (\(.+\) )?(ounce|oz|cup|pound|lb|teaspoon|tsp|tablespoon|tblsp|liter|gallon|quart|pint|slice|clove)?(s? |\s*)(.+)/
  end
  
  def parse(str)
    ingredients = []
    
    match = @pat.match(str)
    str = str
  
    str.lines.each do |l|
        l.strip.match(@pat)
        ingredients << ["#{$1}#{$2}#{$3}", "#{$5}", "#{$4}#{$7}"]
    end

    p ingredients
    return ingredients

  end
  
end

# str = "1 (8 ounce) package angel hair pasta
# 2.5 cups baking soda
# 1/2 cup butter
# 4 cloves minced garlic
# 1 pound shrimp, peeled and deveined
# 1 cup dry white wine
# 1/4 teaspoon ground black pepper
# 3/4 cup grated Parmesan cheese
# 1 tablespoon chopped fresh parsley
# 6 cups romaine lettuce
# 1/2 small red onion, diced
# 3/4 cup grape tomatoes, cut in half
# 3 slices Wonder® Classic White Bread
# 1/2 cup light mayonnaise
# 1 tablespoon lemon juice
# 1 clove garlic, minced
# 1/4 teaspoon seasoned salt
# 6 slices bacon, cooked crisp and crumbled
# 3 cups all-purpose flour
# 2 cups white sugar
# 3 teaspoons baking soda
# 6 tablespoons unsweetened cocoa powder
# 1 teaspoon salt
# 2/3 cup vegetable oil
# 3 tablespoons distilled white vinegar
# 2 teaspoons vanilla extract
# 2 cups water
# 1/2 cup butter, softened
# 1/2 cup shortening
# 2/3 cup milk
# 1 teaspoon vanilla extract
# 1 cup white sugar"
# 

# num = 1234567890
# 
# parser = IngredientParser.new
# result = parser.parse(num)
# p result

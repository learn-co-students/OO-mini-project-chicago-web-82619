class RecipeIngredient

#join between Recipe and Ingredient
  @@all = []
  attr_reader :recipe, :ingredients

  def initialize(recipe, ingredients)
    @ingredients, @recipe = ingredients, recipe
    @@all << self
  end

  def self.all
    @@all
  end


end

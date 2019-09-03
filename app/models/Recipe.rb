class Recipe
  attr_reader :name
  @@all = []
  
  # Initialize a Recipe.
  def initialize(name)
    @name = name
    @@all << self
  end

  # Return a list of Users that use this recipe.
  def users
    RecipeCard.all.select do |card| 
      card.recipe == self
    end.map {|card| card.user}
  end

  # Return a list of Ingredients used in this recipe.
  def ingredients
    RecipeIngredient.all.select do |ri| 
      ri.recipe == self
    end.map {|ri| ri.ingredient}
  end

  # Return a list of the potential allergens in this recipe.
  def allergens
    ingredients & User.all.collect {|user| user.allergens}.flatten
  end

  # Add all of the ingredients to RecipeIngredient objects.
  def add_ingredients(new_ingredients)
    new_ingredients.each do
      |ingredient| RecipeIngredient.new(self, ingredient) unless ingredients.include?(ingredient)
    end
  end

  # Return the most popular recipe, by frequency of appearance in RecipeCards.
  def self.most_popular
    frequency_tbl = Hash.new(0)
    RecipeCard.all.each {|card| frequency_tbl[card.recipe] += 1} 
    frequency_tbl.keys.sort_by {|recipe| frequency_tbl[recipe]}[-1]
  end

  # Return a list of all Recipes.
  def self.all
    @@all
  end
end
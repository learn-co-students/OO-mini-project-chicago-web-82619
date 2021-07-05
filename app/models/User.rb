class User
  @@all =[]
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def self.all
    @@all
  end

  def recipe_cards
    RecipeCard.select {|recipe_card| recipe_card.user == self}
  end

  def recipes
    recipe_cards.collect {|recipe_card| recipe_card.recipe}
  end

  def add_recipe_card(recipe, date, rating)
    RecipeCard.new(self, recipe, date,rating)
  end

  def declare_allergy(*ingredient)
    Allergy.new(self, ingredient)
  end

  def allergens
    Allergy.all.select {|allergy| allergy.user == self}
    .collect {|allergy| allergy.ingredient}
  end

  def top_three_recipes
    recipe_cards.max(3) {|recipe1,recipe2| recipe1.rating <=> recipe2.rating}
    .collect {|recipe_card| recipe_card.recipe}
  end

  def most_recent_recipe
    recipe_cards.max {|recipe1,recipe2| recipe1.date <=> recipe2.date}
  end

end

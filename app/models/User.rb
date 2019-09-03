class User
  attr_reader :name
  @@all = []
  
  # Initialize a User.
  def initialize(name)
    @name = name
    @@all << self
  end

  # Return a list of all RecipeCards associated with the User.
  def recipe_cards
    RecipeCard.all.select {|card| card.user == self}
  end

  # Return a list of all Recipes associated with the User.
  def recipes
    recipe_cards.map {|card| card.recipe}
  end

  # Return a list of all Ingredients the User is allergic to.
  def allergens
    Allergy.all.select do |allergy|
      allergy.user == self
    end.map {|allergy| allergy.ingredient}
  end

  # Return the User's top three Recipes by rating.
  def top_three_recipes
    recipe_cards.sort_by do |card|
      card.rating
    end.last(3).map {|card| card.recipe}.reverse
  end

  # Return the User's most recently added Recipe.
  def most_recent_recipe
    recipe_cards.reduce do |memo, recipe|
      memo.date > recipe.date ? memo : recipe
    end.recipe
  end

  # Return a list of the Recipes containing none of the User's allergens.
  def safe_recipes
    Recipe.all.select do |recipe|
      safe = recipe.ingredients.reduce(true) do |memo, ingredient|
        memo && !self.allergens.include?(ingredient)
      end
    end
  end

  # Add a new RecipeCard for a User.
  def add_recipe_card(recipe, date, rating)
    RecipeCard.new(self, recipe, date, rating)
  end

  # Add a new Allergy for a User.
  def declare_allergy(ingredient)
    Allergy.new(self, ingredient)
  end

  # Return all Users.
  def self.all
    @@all
  end
end
class Recipe

  @@all = []
  attr_accessor :name

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def self.most_popular
    all.max {|a, b| a.users.count <=> b.users.count }
  end

  def users
    RecipeCard.all.select {|recipe_card| recipe_card.recipe == self}
    .collect {|recipe_card| recipe_card.user}
  end

  def ingredients
    RecipeIngredient.all.select {|recipe_ingredient| recipe_ingredient.recipe == self}
    .collect { |recipe_ingredient| recipe_ingredient.ingredients }.flatten
  end

  def allergens
    self.ingredients.collect {|ingredient| ingredient.allergies }
  end

  def add_ingredients(*ingredients)
    RecipeIngredient.new(self, *ingredients)

  end



end

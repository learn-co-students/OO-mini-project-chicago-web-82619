class Recipe
    attr_accessor :name
    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def users
        RecipeCard.all.select {|recipe| recipe.recipe == self}.collect {|recipe| recipe.user}
    end

    def self.most_popular
        all.max {|a, b| a.users.count  <=> b.users.count}
    end

    def ingredients
        RecipeIngredient.all.select {|recipe| recipe.recipe == self}.collect {|recipe| recipe.ingredient}
    end

    def allergens
        ingredients.flatten.select {|ingredient| ingredient.allergies}
    end

    def add_ingredients(*ingredients)
        RecipeIngredient.new(self, ingredients)
    end


end
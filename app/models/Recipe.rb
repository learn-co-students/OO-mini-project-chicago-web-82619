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

    
    def self.most_popular
        all_recipes = RecipeCard.all.collect {|recipe_card| recipe_card.recipe }
        all_recipes.max_by {|recipe| all_recipes.count(recipe)}
    end

    def users
        RecipeCard.all.map {|card| card.user}.uniq
    end

    def ingredients
        RecipeIngredient.all.collect {|recipe| recipe.ingredients}
    end

    def add_ingredients(ingredients)
        RecipeIngredient.new(self, ingredients)
    end

    def allergens
        Allergy.all.collect {|allergy| allergy.ingredient}
    end
end

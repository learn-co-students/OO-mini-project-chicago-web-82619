class Recipe

    attr_reader :name
    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all 
        @@all
    end

    def self.most_popular
        recipes_by_card = RecipeCard.all.map {|card| card.recipe}
        recipe_count = Hash.new(0)
        recipes_by_card.each {|card| recipe_count[card] += 1}
        recipe_count.sort_by { |card,number| number}.last[0]
    end

    def recipecards
        RecipeCard.all.select {|card| card.recipe == self}
    end

    def users
        recipecards.map {|card| card.user}
    end

    def ingredients
        RecipeIngredient.all.select {|ingredient| ingredient.recipe == self}
    end

    def allergens
        all_ingredients = ingredients.map {|ingredients| ingredients.ingredient}
        allergens = Allergy.all.map {|allergen| allergen.ingredient}
        Ingredient.all & allergens
    end

    def add_ingredients(ingredient_arr)
        ingredient_arr.each {|ingredient| RecipeIngredient.new(self, ingredient)}
    end

end
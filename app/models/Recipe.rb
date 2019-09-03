class Recipe
    attr_reader :name
    @@all = []

    def self.all
        @@all
    end

    def initialize(name)
        @name = name
        self.class.all << self
    end

    def self.most_popular
        recipes = RecipeCard.all.map { |card| card.recipe }
        recipes.sort_by { |recipe| recipes.count(recipe) }.last

        # recipes = RecipeCard.all
        # recipe_hash = Hash.new(0)
        # recipes.each {|recipecard| recipe_hash.store(recipecard.recipe, recipe_hash[recipecard.recipe] + 1)}
        # most_popular = 0
        # name_of_most_popular = nil
        # recipe_hash.each do |recipecard, num|
        #     if num > most_popular
        #         most_popular = num
        #         name_of_most_popular = recipecard
        #     end
        # end
        # name_of_most_popular
    end

    def users
        r = RecipeCard.all.select {|recipecard| recipecard.recipe == self}
        r.map {|card| card.user}
    end

    def ingredients
        arr = RecipeIngredient.all.select {|recipeingredient| recipeingredient.recipe == self}
        arr.map {|card| card.ingredient}
    end

    def allergens
        Allergy.all.map {|allergy| allergy.ingredient} & ingredients
    end

    def add_ingredients(new_ingredients)
        new_ingredients.each do |ingredient| 
            if !self.ingredients.include?(ingredient)
                RecipeIngredient.new(self, ingredient) 
            end
        end

    end



end

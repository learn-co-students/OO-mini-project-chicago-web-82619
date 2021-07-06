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
        recipe_count = Hash.new(0)
        all_recipes.each {|recipe| recipe_count[recipe] += 1}
        recipe_count.keys.sort_by {|recipe| recipe_count[recipe]}[-1]
 
        # all_recipes = RecipeCard.all.map { |recipe_card| recipe_card.recipe } 
        # results = all_recipes.reduce(Hash.new(0)) {|h,c| h[c] += 1; h}
        # sorted = results.sort_by{|key,value| value}.reverse
        # top = sorted[0][1]
        # most_frequent = sorted.take_while{|key,value| value == top}
        # a = most_frequent.map {|recipe| recipe[0]}
        # a.each {|recipe| recipe}
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

# hash.keys[0]
class User
    attr_accessor :name

    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end
    
    def recipes
        RecipeCard.all.select  do |recipe_card| 
            recipe_card.user == self
        end
    end

    def add_recipe_card(name, recipe, rating)
        RecipeCard.new(name, recipe, self, rating)
    end

    def declare_allergy(name, ingredient)
        Allergy.new(name, self, ingredient)
    end

    def allergens
        allergies = Allergy.all.select {|allergy| allergy.user == self}
        allergies.collect {|allergy| allergy.ingredient}
    end

    def top_three_recipes
        recipes.sort_by {|recipe| recipe.rating}.reverse[0..2]
    end
    
    def most_recent_recipe
        recipes.sort_by {|recipe| recipe.date}.last
    end
end
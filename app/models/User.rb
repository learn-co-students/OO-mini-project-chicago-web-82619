class User

    attr_reader :name
    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all 
        @@all
    end

    def recipes
        recipecards.map {|card| card.recipe}
    end

    def recipecards
        RecipeCard.all.select {|card| card.user == self}
    end

    def add_recipe_card(recipe, date, rating)
        RecipeCard.new(recipe, self, date, rating)
    end

    def declare_allergen(ingredient)
        Allergy.new(self, ingredient)
    end

    def allergens
        arr = Allergy.all.select {|allergen| allergen.user == self}
        arr.map {|allergen| allergen.ingredient}
    end

    def top_three_recipes
        all_cards = RecipeCard.all.select {|card| card.user == self}
        all_cards.sort_by {|card| card.rating}.last(3)
    end

    def most_recent_recipe
        all_cards = RecipeCard.all.select {|card| card.user == self}
        all_cards.sort_by {|card| card.date}.last
    end

end
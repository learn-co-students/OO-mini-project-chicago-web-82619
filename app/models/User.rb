class User
    attr_reader :name

    @@all = []

    def self.all
        @@all
    end

    def initialize(name)
        @name = name
        self.class.all << self
    end

    def recipe_cards
        RecipeCard.all.select { |card| card.user == self }
    end

    def recipes
        recipe_cards.map { |card| card.recipe }
    end

    def add_recipe_card(recipe, date, rating)
        RecipeCard.new(self, recipe, date, rating)
    end

    def declare_allergy(ingredient)
        Allergy.new(self, ingredient)
    end

    def allergens
        Allergy.all.select { |allergy| allergy.user == self }.map { |allergy| allergy.ingredient }
    end

    def top_three_recipes
        cards = RecipeCard.all.select { |card| card.user == self }
        cards = cards.sort_by { |card| card.rating }.reverse
        [cards[0], cards[1], cards[2]]
    end

    def most_recent_recipe
       #all recipe cards related to user
       recipe_cards.sort_by {|card| card.date}.last
    end

end

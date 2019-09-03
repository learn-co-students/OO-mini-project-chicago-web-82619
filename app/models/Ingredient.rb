class Ingredient
    attr_reader :name

    @@all = []

    def self.all
        @@all
    end

    def initialize(name)
        @name = name
        self.class.all << self
    end

    def self.most_common_allergen
        # get all ingredients that have an allergy
        allergies = Allergy.all.map { |allergy| allergy.ingredient }
        allergies.sort_by {|ingredient| allergies.count(ingredient)}.last
    end



end


class Ingredient

    attr_reader :name
    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def self.most_common_allergen
        allergens = Allergy.all.map {|allergen| allergen.ingredient.name}
        allergen_count = Hash.new(0)
        allergens.each {|allergen| allergen_count[allergen] += 1}
        allergen_count.sort_by { |allergen,number| number}.last[0]
    end

end
class Ingredient
    attr_accessor :name

    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end
    
    def self.all
        @@all
    end

    def allergies
        Allergy.all.select {|allergy| allergy.ingredient == self}
    end

    def self.most_common_allergen
        self.all.max {|a,b| a.allergies.count <=> b.allergies.count}
    end
end        


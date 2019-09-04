class RecipeCard
    attr_accessor :user, :recipe, :date, :rating
    
    @@all = []

    def initialize(user, recipe, rating = nil)
        @user = user 
        @recipe = recipe
        @date = Time.now
        @rating = rating
        @@all << self
    end

    def self.all
        @@all
    end
end
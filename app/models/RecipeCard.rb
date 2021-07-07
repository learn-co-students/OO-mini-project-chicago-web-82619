class RecipeCard

    attr_accessor :date, :rating, :user, :recipe
    @@all = []

    def initialize(recipe, user, date, rating)
        @date = date
        @rating = rating
        @user = user
        @recipe = recipe
        @@all << self
    end 

    def self.all
        @@all
    end

end
class RecipeCard
    attr_reader :user, :recipe,:date, :rating

    @@all = []

    def self.all
        @@all
    end

    def initialize(user, recipe, date, rating)
        @user = user
        @recipe = recipe
        @date = date
        @rating = rating
        self.class.all << self
    end



end

require_relative '../config/environment.rb'


user = User.new("Garfield")
recipe = Recipe.new("Lasagna")

user2 = User.new("George")
recipe2 = Recipe.new("Bananas")

ingredient = Ingredient.new("Banana")

user.declare_allergy(ingredient)




user.add_recipe_card(recipe, Date.today.next_day, 10)
user2.add_recipe_card(recipe2, Date.today, 8)




binding.pry

true

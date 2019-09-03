require_relative '../config/environment.rb'
require 'pry'


andrew = User.new("Andrew")
joseph = User.new("Joseph")


borsch = Recipe.new("Borsch")
varenyky = Recipe.new("Varenyky")
sour_cream_soup = Recipe.new("Sour Cream_soup")


# andrews_recipe = RecipeCard.new(andrew,borsch,10)
joseph_recipe = RecipeCard.new(joseph,borsch,1)
joseph_recipe4 = RecipeCard.new(joseph,borsch,4)
joseph_recipe = RecipeCard.new(joseph,varenyky,9)
andrews_recipe1 = RecipeCard.new(andrew,varenyky,2)
andrews_recipe2 = RecipeCard.new(andrew,varenyky,7)
joseph_recipe19 = RecipeCard.new(joseph,sour_cream_soup,2)


beets = Ingredient.new("Beets")
flour = Ingredient.new("Flour")
potato = Ingredient.new("Potato")
sour_cream = Ingredient.new("Sour Cream")
onion = Ingredient.new("Onion")
beans = Ingredient.new("Beans")
meat = Ingredient.new("Meat")

borsch.add_ingredients([onion, beets, meat, sour_cream])
sour_cream_soup.add_ingredients([sour_cream, meat, flour])

sour_cream = Allergy.new(andrew, sour_cream)
sour_cream = Allergy.new(joseph, sour_cream)
meat = Allergy.new(joseph, meat)

binding.pry
true
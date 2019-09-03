require_relative '../config/environment.rb'

avinash = User.new('avinash')
zac = User.new('zac')
aaron = User.new('aaron')

carrot = Ingredient.new('carrot')
milk = Ingredient.new('milk')
cheese = Ingredient.new('cheese')
slice_of_bread = Ingredient.new('slice of bread')
black_olive = Ingredient.new('black olive')
pepperoni = Ingredient.new('pepperoni')
shrimp = Ingredient.new('shrimp')

grilled_cheese = Recipe.new('grilled cheese')
pizza = Recipe.new('pizza')
cake = Recipe.new('cake')
seafood_recipe = Recipe.new('seafood recipe')

pizza_recipe_card = RecipeCard.new(zac, grilled_cheese, 2001, 8)
cake_recipe_card = RecipeCard.new(avinash, cake, 2002, 5)
seafood_recipe_recipe_card = RecipeCard.new(aaron, seafood_recipe, 1999, 10)
cake_recipe_card2 = RecipeCard.new(zac, cake, 2004, 10)
cake_recipe_card3 = RecipeCard.new(zac, cake, 1996, 2)
cake_recipe_card4 = RecipeCard.new(zac, cake, 2018, 6)

grilled_cheese_recipe_ingredient = RecipeIngredient.new(grilled_cheese, cheese)
cake_recipe_ingredient = RecipeIngredient.new(cake, milk)
cake_recipe_ingredient = RecipeIngredient.new(cake, shrimp)
cake_recipe_ingredient = RecipeIngredient.new(cake, carrot) 
pizza_recipe_ingredient = RecipeIngredient.new(pizza, cheese)

new_ingredients = [milk, cheese, slice_of_bread, black_olive]

lactose_intolerant = Allergy.new(avinash, milk)
seafood_allergy = Allergy.new(zac, shrimp)
seafood_allergy = Allergy.new(zac, shrimp)
carrot_allergy = Allergy.new(avinash, carrot)
carrot_allergy = Allergy.new(avinash, carrot)

binding.pry

true

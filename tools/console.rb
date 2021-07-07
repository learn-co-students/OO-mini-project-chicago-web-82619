require_relative '../config/environment.rb'

cheese = Ingredient.new('Cheese')
sauce = Ingredient.new('Sauce')
dough = Ingredient.new('Dough')
pb = Ingredient.new('Peanut Butter')
jelly = Ingredient.new('Jelly')
bread = Ingredient.new('Bread')
milk = Ingredient.new('Milk')
cereal = Ingredient.new('Cereal')

gary = User.new('Gary')
james = User.new('James')
maria = User.new('Joe')

pizza = Recipe.new('Pizza')
pizza.add_ingredients([cheese, sauce, dough])
pbj = Recipe.new('Peanut Butter and Jelly')
pbj.add_ingredients([pb, jelly, bread, milk])
cer = Recipe.new('Cereal')
cer.add_ingredients([milk, cereal])
gc = Recipe.new('Grilled Cheese')
gc.add_ingredients([cheese, bread])

gary.add_recipe_card(pizza, '2019-11-28', 100)
gary.add_recipe_card(pbj, '2019-11-27', 100)
gary.add_recipe_card(cer, '2019-11-26', 5)
gary.add_recipe_card(gc, '2019-11-25', 70)
james.add_recipe_card(pbj, '2019-11-28', 50)
james.add_recipe_card(gc, '2019-11-27', 100)
maria.add_recipe_card(gc, '2018-11-06', 100)

gary.declare_allergen(pb)
gary.declare_allergen(milk)
james.declare_allergen(pb)
james.declare_allergen(dough)

binding.pry

require_relative '../config/environment.rb'
require 'pry'
r = Recipe.new('jumbolaya')
q = Recipe.new('bulgogi')

u = User.new('joe')
k = User.new('kyle')

o = Ingredient.new('onion')
t = Ingredient.new('tomato')

c1 = RecipeCard.new(u, r, 1, 10.0)
c2 = RecipeCard.new(k, r, 2, 9.0)
c3 = RecipeCard.new(k, q, 3, 8.0)

i1 = RecipeIngredient.new(r, t)
i2 = RecipeIngredient.new(q, o)

a1 = Allergy.new(u, t)
a2 = Allergy.new(k, o)
a3 = Allergy.new(k, t)
binding.pry
true

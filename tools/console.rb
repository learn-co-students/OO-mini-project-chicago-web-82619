require_relative '../config/environment.rb'
require 'date'
require 'pry'

user = User.new("George")
user2 = User.new("Kyle")
user3 = User.new("Sam")

recipe = Recipe.new("lasagna")
recipe2 = Recipe.new("banana")

ingredient = Ingredient.new("banana")
ingredient2 = Ingredient.new("chocolate")
ingredient3 = Ingredient.new("peanut butter")



user.add_recipe_card(recipe, Date.today.next_day, 10)
user.add_recipe_card(recipe2, Date.today, 8)
user.declare_allergy("banana")
user.declare_allergy("peanuts")
user2.declare_allergy("peanuts")
recipe2.add_ingredients(ingredient, ingredient2)

binding.pry
puts "end"

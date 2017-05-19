# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'json'
require 'open-uri'
puts 'Cleaning database...'

Ingredient.destroy_all
Cocktail.destroy_all

url = 'http://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
user_serialized = open(url).read
ingredient = JSON.parse(user_serialized)

ingredient["drinks"].first(6).each do |ingredient|
  Ingredient.create(name: ingredient["strIngredient1"])
end


# url_cocktails = 'http://www.thecocktaildb.com/api/json/v1/1/filter.php?a=Alcoholic'
# cocktail_serialized = open(url_cocktails).read
# cocktails = JSON.parse(cocktail_serialized)

# cocktails["drinks"].first(6).each do |cocktail|
#   Cocktail.create(name: cocktail["strDrink"])
# end

url = "http://static.750g.com/images/622-auto/b520523117d647dab6b842a36f4cc7f5/mojito-le-vrai.jpg"
cocktail = Cocktail.new(name: 'Mojito')
cocktail.remote_photo_url = url
cocktail.save

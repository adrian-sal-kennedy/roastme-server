# Create users

10.times do
    User.create(username: Faker::Name.name )
end

# Create recipes

10.times do |i|
    3.times do |j|
        method = {step1: i, step2: j}
        Recipe.create(title:"recipe: #{i+j}", method: method.to_json, blog:"cool story", user_id: i+1)
    end
end

# Create favourites

User.all.each do |user| 
    Favourite.create(user_id: user.id)

    5.times do 
        user.favourite.favourites_recipes.create(recipe_id: rand(1..Recipe.all.length))
    end
end

# Create ingredients

10.times do 
    Ingredient.create(name:Faker::Food.ingredient)
end

# Create tags

10.times do
    Tag.create(tag:Faker::Color.color_name)
end

# Give recipes tags and ingredients

3.times do 
    Recipe.all.each do |recipe|
        recipe.recipes_ingredients.create(quantity: "1 cup", ingredient_id: rand(1..Ingredient.all.length))
        recipe.recipes_tags.create(tag_id: rand(1..Tag.all.length))
    end
end

3.times do
    User.all.each do |user|
        user.posts.create(recipe_id: rand(1..Recipe.all.length), post:Faker::Games::Witcher.quote)
    end
end
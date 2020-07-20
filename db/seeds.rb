# Specific user

User.create(username: "Guy", email:"admin@admin.com", password:"password")
10.times do 
    User.first.recipes.create(title:Faker::Food.dish, method: {step1: "cook it", step2: "eat"}.to_json, blog:Faker::Food.description)
end

# Create users

20.times do
    User.create(username: Faker::Name.name, email: Faker::Internet.email, password: "password")
end

# Create recipes

20.times do |i|
    6.times do |j|
        method = {step1: i, step2: j}
        Recipe.create(title:"recipe: #{i+j}", method: method.to_json, blog:"cool story", user_id: i+1)
    end
end

# Create favourites

User.all.each do |user| 
    Favourite.create(user_id: user.id)

    6.times do 
        user.favourite.favourites_recipes.create(recipe_id: rand(1..Recipe.all.length))
    end
end

# Create ingredients

20.times do 
    Ingredient.create(name:Faker::Food.ingredient)
end

# Create tags

20.times do
    Tag.create(tag:Faker::Color.color_name)
end

# Give recipes tags and ingredients

5.times do 
    Recipe.all.each do |recipe|
        recipe.recipes_ingredients.create(quantity: "1 cup", ingredient_id: rand(1..Ingredient.all.length))
        recipe.recipes_tags.create(tag_id: rand(1..Tag.all.length))
    end
end

# Create posts

5.times do
    User.all.each do |user|
        user.posts.create(recipe_id: rand(1..Recipe.all.length), post:Faker::Games::Witcher.quote)
    end
end

# Distribute followers

User.all.each do |user| 
    Following.create(user)
end
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
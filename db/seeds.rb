# Specific user

User.create(username: "Guy", email:"admin@admin.com", password:"password")
10.times do 
    User.first.recipes.create(title:Faker::Food.dish, method: {step1: "cook it", step2: "eat"}.to_json, blog:Faker::Food.description)
end

pp "Created admin"

# Create users

20.times do
    User.create(username: Faker::Name.name, email: Faker::Internet.email, password: "password")
end

pp "Created users"

# Create recipes

# create a long one for purposes of developing some summary logic
# ripped off from https://www.italianfoodforever.com/2008/05/nonnas-lasagna/
Recipe.create(
  title: "Nonna's Lasagne",
  blog: 'This recipe is a family favorite, often served for special occasions that is created with a tasty tomato sauce with tiny meatballs and creamy mozzarella, which are layered between delicate sheets of homemade egg noodles.

You can of course use store bought noodles but the end result will just not be as tender as if you made them yourself. I often vary this recipe by adding a couple of layers of bechamel sauce between layers of the tomato meatball layers which creates a nice creamy texture.',
  method: {
    :"1" => 'To make the pasta, follow the directions for Homemade Egg Pasta. After rolling, cut into 12 inch long strips, then precook in boiling water for 30 seconds and place in ice water.',
    :"2" => 'Dry and set aside on clean kitchen towels.',
    :"3" => 'To make the sauce, heat the olive oil in a saucepan and once hot add the pork bones over medium heat and cook until well browned. Add the onion and continue cooking until it is tender. Add the garlic and stir well, cooking an additional minute. Finally add the puree, paste and 1 cup of water.',
    :"4" => 'Next add the oregano, 1/2 cup of the parsley, the basil, red pepper flakes and salt and pepper. Bring everything to a boil and then reduce heat to a simmer.',
    :"5" => 'Taking the ground beef (or beef/veal mix), and add the egg, bread crumbs, 1/4 parsley, 1/3 cup Parmesan Cheese and salt and pepper. Add the milk to the bread cubes and soak. Once the bread is soft use your fingers to break it up and then add it to the meat mixture. Mix all the ingredients together well with your hands, and then roll into small 1 inch sized meatballs and drop carefully in the sauce.',
    :"6" => 'Continue cooking the sauce for about 2 hours over low heat, adding additional water as needed if the sauce becomes too thick.',
    :"7" => 'Remove the meatballs and the pork bones from the sauce with a slotted spoon and place into a small bowl when the sauce is complete.',
    :"8" => 'To assemble the lasagne, add about 1/2 cup of sauce to the bottom of a large lasagne pan, then add a little water and mix.Make an overlapping layer of the noodles across the bottom of the pan. Spread a large spoonful of sauce on top, making sure the noodles are well covered. Add one more layer of noodles and sauce, and then add a layer of the mozzarella slices. Continue in this manner until you have 5 layers.',
    :"9" => 'On the top, cover the noodles well with the sauce, place another layer of mozzarella, then sprinkle on the parmesan. To finish, evenly place the meatballs across the top surface.',
    :"10" => 'Cover with foil, and bake in a preheated 375 degree F. oven for about 30 minutes. Remove the foil and cook another 10 minutes. Let rest an additional 10 minutes before serving.'
  }.to_json,
  user_id: 1
)

20.times do |i|
    6.times do |j|
        method = {step1: i, step2: j}
        Recipe.create(title:"recipe: #{i+j}", method: method.to_json, blog:"cool story", user_id: i+1)
    end
end

pp "Created recipes"

# Create favourites

User.all.each do |user| 
    # Favourite.create(user_id: user.id)

    6.times do 
        user.favourite.favourites_recipes.create(recipe_id: rand(1..Recipe.all.length))
    end
end

pp "Created favourites"

# Create ingredients

20.times do 
    Ingredient.create(name:Faker::Food.ingredient)
end

pp "Created ingredients"

# Create tags

20.times do
    Tag.create(tag:Faker::Color.color_name)
end

pp "Created tags"

# Give recipes tags and ingredients

5.times do 
    Recipe.all.each do |recipe|
        recipe.recipes_ingredients.create(quantity: "1 cup", ingredient_id: rand(1..Ingredient.all.length))
        recipe.recipes_tags.create(tag_id: rand(1..Tag.all.length))
    end
end

pp "Created link from tags/ingredients to recipes"

# Create posts

5.times do
    User.all.each do |user|
        user.posts.create(recipe_id: rand(1..Recipe.all.length), post:Faker::Games::Witcher.quote)
    end
end

pp "Created posts"

# Randomly assorting followers

User.all.each do |user|
    # Following.create(user_id:user.id)
    user.following.followings_users.create(user_id: rand(1..User.all.length))
end

pp "assigned followers"
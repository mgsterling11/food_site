User.destroy_all
Category.destroy_all
Ingredient.destroy_all
Proportion.destroy_all
Recipe.destroy_all
Step.destroy_all
Unit.destroy_all
Favorite.destroy_all
State.destroy_all
Season.destroy_all
StateSeason.destroy_all
StateSeasonIngredient.destroy_all

#######################

admin = User.create([{name: 'Admin', email: 'admin@flatironschool.com', password: 'jeffkatz', password_confirmation: 'jeffkatz', public_profile: true, admin: true}, {name: 'Jessie', email: 'jessie@cookbook.com', password: 'jessie', password_confirmation: 'jessie', public_profile: true, admin: true}, {name: 'Amanda', email: 'amanda@cookbook.com', password: 'amanda', password_confirmation: 'amanda', public_profile: true, admin: true}, {name: 'Michael', email: 'michael@cookbook.com', password: 'michael', password_confirmation: 'michael', public_profile: true, admin: true}, {name: 'Danny', email: 'danny@cookbook.com', password: 'danny', password_confirmation: 'danny', public_profile: true, admin: true} ])

#######################

states = ['Alabama','Alaska','Arizona','Arkansas','California','Colorado','Connecticut','Delaware','Florida','Georgia','Hawaii','Idaho','Illinois','Indiana','Iowa','Kansas','Kentucky','Louisiana','Maine','Maryland','Massachusetts','Michigan','Minnesota','Mississippi','Missouri','Montana','Nebraska','Nevada','New-Hampshire','New-Jersey','New-Mexico','New-York','North-Carolina','North-Dakota','Ohio','Oklahoma','Oregon','Pennsylvania','Rhode-Island','South-Carolina','South-Dakota','Tennessee','Texas','Utah','Vermont','Virginia','Washington','West-Virginia','Wisconsin','Wyoming']

states.each do |state|
  State.create(name: state)
end
#######################
seasons = [{'EARLY JANUARY'=> '01'},{'EARLY FEBRUARY'=> '02'},{'EARLY MARCH'=> '03'},{'EARLY APRIL'=> '04'},{'EARLY MAY'=> '05'},{'EARLY JUNE'=> '06'},{'EARLY JULY'=> '07'},{'EARLY AUGUST'=> '08'},{'EARLY SEPTEMBER'=> '09'},{'EARLY OCTOBER'=> '10'},{'EARLY NOVEMBER'=> '11'},{'EARLY DECEMBER'=> '12'},{'LATE JANUARY'=> '01'},{'LATE FEBRUARY'=> '02'},{'LATE MARCH'=> '03'},{'LATE APRIL'=> '04'},{'LATE MAY'=> '05'},{'LATE JUNE'=> '06'},{'LATE JULY'=> '07'},{'LATE AUGUST'=> '08'},{'LATE SEPTEMBER'=> '09'},{'LATE OCTOBER'=> '10'},{'LATE NOVEMBER'=> '11'},{'LATE DECEMBER'=> '12'}]

seasons.each do |season|
  Season.create(name: season.keys[0], month: season.values[0])
end

#######################
Adapters::StateConnection.new.page_navigation

#######################
users = User.create([{name: 'Jeffers', email: 'clevergirl@jurassicpark.gov', password: 'password', password_confirmation: 'password', public_profile: true},
                    {name: 'Allegria', email: 'fluffy@flatironschool.com', password: 'fruitfly', password_confirmation: 'fruitfly', public_profile: true}
                  ])

#######################
categories = Category.create([{name: 'dinner'}, {name: 'breakfast'},{name: 'lunch'}, {name: 'gluten-free'}, {name: 'mexican'}, {name: 'thanksgiving'}])


#######################
units50 = Unit.create(name: "pound",abbreviation: "lbs")
units51 = Unit.create(name: "sprig")
units52 = Unit.create(name: "pinch")
units53 = Unit.create(name: "cup")
units54 = Unit.create(name: "tablespoons",abbreviation: "tbs")
units55 = Unit.create(name: "teaspoon")
units56 = Unit.create(name: 'bunch')
units57 = Unit.create(name: 'cups')

gumbo = Recipe.new(name: 'Chicken and Gumbo' , view_count: 0, user_id: User.first.id, image_url: 'http://www.simplecomfortfood.com/wp-content/uploads/2012/10/chicken-gumbo-recipe-high.jpg', public_recipe: false)
gumbo.categories = [categories[0]]

ingredient1 = Ingredient.create(name: 'large boneless skinless chicken breast halves')
proportion1 = gumbo.proportions.build([unit_id: nil, ingredient_id: ingredient1.id, quantity:3])

ingredient2 = Ingredient.create(name: 'Salt and pepper')
proportion2 = gumbo.proportions.build([unit_id: nil, ingredient_id: ingredient2.id, quantity: nil])

ingredient3 = Ingredient.create(name: 'vegetable oil')
proportion3 = gumbo.proportions.build([unit_id: units53.id, ingredient_id: ingredient3.id, quantity: 0.25])

ingredient4 = Ingredient.create(name: 'all-purpose flour')
proportion4 = gumbo.proportions.build([unit_id: units53.id,  ingredient_id: ingredient4.id, quantity: 0.25])

ingredient5 = Ingredient.create(name: 'margarine')
proportion5 = gumbo.proportions.build([unit_id: units54.id, ingredient_id: ingredient5.id, quantity: 5])

ingredient6 = Ingredient.create(name: 'large onion, chopped')
proportion6 = gumbo.proportions.build([unit_id: nil, ingredient_id: ingredient6.id, quantity: 1])

ingredient7 = Ingredient.create(name: 'green bell pepper, seeded and chopped')
proportion7 = gumbo.proportions.build([unit_id: nil, ingredient_id: ingredient7.id, quantity: 1])

ingredient8 = Ingredient.create(name: 'stalks celery chopped')
proportion8 = gumbo.proportions.build([unit_id: nil, ingredient_id: ingredient8.id, quantity: 3])

ingredient9 = Ingredient.create(name: 'Worcestershire sauce')
proportion9 = gumbo.proportions.build([unit_id: units53.id, ingredient_id: ingredient9.id, quantity: 0.25])

ingredient10 = Ingredient.create(name: 'flat leaf parsley, stems and leaves, coarsely chopped, plus chopped leaves for garnish')
proportion10 = gumbo.proportions.build([unit_id: units56.id, ingredient_id: ingredient10.id, quantity: 0.25])

ingredient11 = Ingredient.create(name: 'hot water')
proportion11 = gumbo.proportions.build([unit_id: units57.id, ingredient_id: ingredient11.id, quantity: 4])

ingredient12 = Ingredient.create(name: 'beef bouillon cubes')
proportion12 = gumbo.proportions.build([unit_id: nil, ingredient_id: ingredient12.id, quantity: 5])

ingredient13 = Ingredient.create(name: '(14-ounce can) stewed tomatoes with juice')
proportion13 = gumbo.proportions.build([unit_id: nil, ingredient_id: ingredient13.id, quantity: 1])

ingredient14 = Ingredient.create(name: 'frozen sliced okra')
proportion14 = gumbo.proportions.build([unit_id: units57.id, ingredient_id: ingredient14.id, quantity: 2])


ingredient15 = Ingredient.create(name: 'green onions, sliced, white and green parts')
proportion15 = gumbo.proportions.build([unit_id: nil, ingredient_id: ingredient15.id, quantity: 4])

ingredient16 = Ingredient.create(name: 'cloves garlic minced')
proportion16 = gumbo.proportions.build([unit_id: nil, ingredient_id: ingredient16.id, quantity: 8])

ingredient17 = Ingredient.create(name: 'small shrimp, peeled, deveined and cooked')
proportion17 = gumbo.proportions.build([unit_id: units50.id, ingredient_id: ingredient17.id, quantity: 0.5])

ingredient18 = Ingredient.create(name: 'smoked sausage, cut into 1/4-inch slices')
proportion18 = gumbo.proportions.build([unit_id: units50.id, ingredient_id: ingredient18.id, quantity:1])

step1 = gumbo.steps.build(description: 'Season the chicken with salt and pepper.')
step2 = gumbo.steps.build(description: 'Heat the oil in a heavy bottomed Dutch oven over medium-high heat. Cook the chicken until browned on both sides and remove.')
step4 = gumbo.steps.build(description: 'Add the sausage and cook until browned, then remove.')
step5 = gumbo.steps.build(description: 'Sprinkle the flour over the oil, add 2 tablespoons of margarine and cook over medium heat, stirring constantly, until brown, about 10 minutes. Let the roux cool.')
step6 = gumbo.steps.build(description: 'Return the Dutch oven to low heat and melt the remaining 3 tablespoons margarine. Add the onion, garlic, green pepper and celery and cook for 10 minutes.')
step7 = gumbo.steps.build(description: 'Add Worcestershire sauce, salt and pepper, to taste and the 1/4 bunch parsley. Cook, while stirring frequently, for 10 minutes.')
step8 = gumbo.steps.build(description: 'Add 4 cups hot water and bouillon cubes, whisking constantly.')
step9 = gumbo.steps.build(description: 'Add the chicken and sausage. Bring to a boil, then reduce the heat, cover, and simmer for 45 minutes.')
step10 = gumbo.steps.build(description: 'Add tomatoes and okra. Cover and simmer for 1 hour.')
step11 = gumbo.steps.build(description: 'Just before serving add the green onions, shrimp and chopped parsley.')

gumbo.save

#######################


omelet = Recipe.new(name: 'shrimp and avocado omelet', view_count: 0, user_id: User.all[1], image_url: 'http://farm3.static.flickr.com/2765/4165912035_70e5e7c364.jpg', public_recipe: true)
omelet.categories = [categories[1]]


ingredient20 = Ingredient.create(name: 'ripe tomato, diced')
proportion20 = omelet.proportions.build([unit_id: nil, ingredient_id: ingredient20.id, quantity: 0.25])

ingredient21 = Ingredient.create(name: 'ripe avocado, diced')
proportion21 = omelet.proportions.build([unit_id: nil, ingredient_id: ingredient21.id, quantity: 0.25])

ingredient22 = Ingredient.create(name: 'chopped fresh cilantro, (optional)')
proportion22 = omelet.proportions.build([unit_id: units54.id, ingredient_id: ingredient22.id, quantity: 1])

ingredient23 = Ingredient.create(name: 'sea salt')
proportion23 = omelet.proportions.build([unit_id: units55.id, ingredient_id: ingredient23.id, quantity: 0.125])

ingredient24 = Ingredient.create(name: 'Freshly ground black pepper')
proportion24 = omelet.proportions.build([unit_id: nil, ingredient_id: ingredient24.id, quantity: nil])


ingredient25 = Ingredient.create(name: 'eggs')
proportion25 = omelet.proportions.build([unit_id: nil, ingredient_id: ingredient25.id, quantity: 2])

ingredient26 = Ingredient.create(name: 'butter')
proportion26 = omelet.proportions.build([unit_id: units54.id, ingredient_id: ingredient26.id, quantity: 1])

ingredient27 = Ingredient.create(name: 'cooked shrimp, chopped roughly')
proportion27 = omelet.proportions.build([unit_id: nil, ingredient_id: ingredient27.id, quantity: 3])

ingredient28 = Ingredient.create(name: 'grated cheese (medium cheddar or Monterey jack)')
proportion28 = omelet.proportions.build([unit_id: units53.id, ingredient_id: ingredient28.id, quantity: 0.33])

step20 = omelet.steps.build(description: 'Toss tomato, avocado and cilantro together in a small bowl. Season to taste with salt and pepper. Set aside.')
step21 = omelet.steps.build(description: 'Beat eggs in a separate small bowl just until whites and yolks are combined, not long enough to become frothy.')
step22 = omelet.steps.build(description: 'Over medium-high heat, melt butter in a 6- or 8-inch skillet (preferably slope-sided and non-stick) until bubbling but not brown. Tilt skillet to spread butter evenly around and up sides.')
step23 = omelet.steps.build(description: 'Pour eggs into the hot skillet, tilting and shaking the pan gently with one hand while stirring eggs briskly with the flat of a fork. Tilt pan and lift edges of omelet with a fork to allow runny egg to reach sides and cook. When eggs begin to firm up and there is almost no runny egg left, add shrimp and cheese, spreading them over the center third of the omelet. Immediately use the fork to fold each side of omelet up over center filling. Tilt the pan to help roll omelet into a loose cylinder. Cook 10 to 30 seconds longer, depending on how brown you prefer the bottom (check for brownness by lifting a corner). Slide omelet onto a warmed plate, top with tomato-avocado mixture and serve.')

omelet.save

###################
mole = Recipe.new(name: 'Mole' , view_count: 0, user_id: User.first.id, image_url: 'http://foodnetwork.sndimg.com/content/dam/images/food/fullset/2003/10/27/1/ad1a01_mole_negro1.jpg.rend.sni12col.landscape.jpeg', public_recipe: true)
mole.categories = [categories[0]]

ingredient100 = Ingredient.create(name: 'ancho chiles')
ingredient101 = Ingredient.create(name: 'guajillo chile')
ingredient102 = Ingredient.create(name: 'dried cascabel chile')
ingredient103 = Ingredient.create(name: 'tomatoes, chopped')
ingredient104 = Ingredient.create(name: 'tomatillo')
ingredient105 = Ingredient.create(name: 'corn oil')
ingredient106 = Ingredient.create(name: 'telera roll')
ingredient107 = Ingredient.create(name: 'cinnamon stick')
ingredient108 = Ingredient.create(name: 'cloves')
ingredient109 = Ingredient.create(name: 'whole peppercorns')
ingredient110 = Ingredient.create(name: 'fresh thyme')
ingredient111 = Ingredient.create(name: 'cumin')
ingredient112 = Ingredient.create(name: 'sesame seeds')
ingredient113 = Ingredient.create(name: 'shelled peanuts')
ingredient114 = Ingredient.create(name: 'blanched almonds')
ingredient115 = Ingredient.create(name: 'small raisins')
ingredient116 = Ingredient.create(name: 'plantains')
ingredient117 = Ingredient.create(name: 'walnuts')
ingredient118 = Ingredient.create(name: 'small onion, roasted, then chopped')
ingredient119 = Ingredient.create(name: 'small garlic clove, roasted, then minced')
ingredient120 = Ingredient.create(name: 'corn tortilla')
ingredient121 = Ingredient.create(name: 'unsweetened chocolate square, Mexican chocolate is preferred')
ingredient122 = Ingredient.create(name: 'chicken stock')
ingredient123 = Ingredient.create(name: 'vegetable shortening')


proportions400 = mole.proportions.build(unit_id: units50.id, ingredient_id:ingredient100.id, quantity:1)
proportions401 = mole.proportions.build(unit_id: units50.id, ingredient_id:ingredient101.id, quantity: 0.5)
proportions402 = mole.proportions.build(unit_id: units50.id, ingredient_id:ingredient102.id, quantity: 0.5)
proportions403 = mole.proportions.build(unit_id: units50.id, ingredient_id:ingredient103.id, quantity:2)
proportions404 = mole.proportions.build(unit_id: units50.id, ingredient_id:ingredient104.id, quantity:1)
proportions405 = mole.proportions.build(unit_id: nil, ingredient_id:ingredient105.id, quantity: nil)
proportions406 = mole.proportions.build(unit_id: nil, ingredient_id:ingredient106.id, quantity:1)
proportions407 = mole.proportions.build(unit_id: nil, ingredient_id:ingredient107.id, quantity:1)
proportions408 = mole.proportions.build(unit_id: nil, ingredient_id:ingredient108.id, quantity:4)
proportions409 = mole.proportions.build(unit_id: units51.id, ingredient_id:ingredient109.id, quantity:4)
proportions410 = mole.proportions.build(unit_id: units52.id, ingredient_id:ingredient110.id, quantity:1)
proportions411 = mole.proportions.build(unit_id: units53.id, ingredient_id:ingredient111.id, quantity:1)
proportions412 = mole.proportions.build(unit_id: units53.id, ingredient_id:ingredient112.id, quantity: 0.5)
proportions413 = mole.proportions.build(unit_id: units53.id, ingredient_id:ingredient113.id, quantity: 0.5)
proportions414 = mole.proportions.build(unit_id: units53.id, ingredient_id:ingredient114.id, quantity: 0.5)
proportions415 = mole.proportions.build(unit_id: nil, ingredient_id:ingredient115.id, quantity: 0.5)
proportions416 = mole.proportions.build(unit_id: units53.id, ingredient_id:ingredient116.id, quantity:1.5)
proportions417 = mole.proportions.build(unit_id: nil, ingredient_id:ingredient117.id, quantity: 0.5)
proportions418 = mole.proportions.build(unit_id: nil, ingredient_id:ingredient118.id, quantity:1)
proportions419 = mole.proportions.build(unit_id: nil, ingredient_id:ingredient119.id, quantity:1)
proportions420 = mole.proportions.build(unit_id: units53.id, ingredient_id:ingredient120.id, quantity:1)
proportions421 = mole.proportions.build(unit_id: units54.id, ingredient_id:ingredient121.id, quantity:1)
proportions422 = mole.proportions.build(unit_id: units53.id, ingredient_id:ingredient122.id, quantity: 0.5)
proportions423 = mole.proportions.build(unit_id: units54.id, ingredient_id:ingredient123.id, quantity:3)

step400 = mole.steps.build(description: 'Toast ancho, guajillo, and cascabel chiles in a heavy skillet until skins blister. Remove from skillet and stem, seed, and devein chiles. Set aside.
')
step401 = mole.steps.build(description: 'Place tomatoes and green tomatoes in a saucepan and bring to a boil. Drain and blend in blender or food processor and set aside.
')
step402 = mole.steps.build(description: 'In a large saucepan, heat corn oil over low flame. Cut the telera bread or 4 slices of white bread, into pieces and fry in the corn oil until golden brown. Add cinnamon stick, cloves, peppercorns, thyme, cumin, sesame seeds, peanuts, almonds, raisins, plantains, and walnuts. Stir ingredients together. Add more corn oil, to coat ingredients lightly. Add chopped roasted onion and minced roasted garlic. Continue to fry over low flame for about 20 minutes. Add blended tomato mixture. Remove from heat and set aside.
')
step403 = mole.steps.build(description: 'Place corn tortilla over open flame and cook until burnt and crispy. Cut up and set aside.
')
step404 = mole.steps.build(description: 'In a medium frying pan, fry roasted chiles in corn oil along with burnt tortilla pieces for a few minutes. Combine tomato/spice/nut mixture with chile mixture in large saucepan. Add chocolate piece and cook until melted over a low flame. Add about 1/2 cup chicken stock to mixture and stir. Place mixture into blender or food processor and puree until all ingredients have combined completely. More chicken stock may be added to smooth out sauce.
')
step405 = mole.steps.build(description: 'In a large saucepan, heat vegetable shortening. Cook the puree in the shortening, stirring constantly. Add more of the chicken stock until you achieve the right level of consistency that you would like. Warm sauce for another 30 minutes over a low flame.')

mole.save


sandwich = Recipe.new(name: 'Vietnamese Chicken Sandwich' , view_count: 0, user_id: User.all[1].id, image_url: 'http://assets.epicurious.com/photos/560d77e6f9a841923089d53a/6:4/w_620%2Ch_413/241475_hires.jpg', public_recipe: true)
sandwich.categories = [categories[2]]

ingredient201 = Ingredient.create(name: 'daikon')
ingredient202 = Ingredient.create(name: 'carrot')
ingredient203 = Ingredient.create(name: 'rice vinegar')
ingredient204 = Ingredient.create(name: 'sugar')
ingredient205 = Ingredient.create(name: 'soft baguette')
ingredient206 = Ingredient.create(name: 'vegetable oil')
ingredient207 = Ingredient.create(name: 'Asian fish sauce')
ingredient208 = Ingredient.create(name: 'soy sauce')
ingredient209 = Ingredient.create(name: 'liverwurst')
ingredient210 = Ingredient.create(name: 'fresh jalapeños, thinly sliced')
ingredient211 = Ingredient.create(name: 'sweet onion, cut into 2/4-inch rings')
ingredient212 = Ingredient.create(name: 'packed cilantro sprigs')
ingredient213 = Ingredient.create(name: 'cooked chicken breasts from a rotisserie chicken, thinly sliced')
ingredient214 = Ingredient.create(name: 'Lettuce leaves')
ingredient215 = Ingredient.create(name: 'mayonnaise')

proportions500 = sandwich.proportions.build(unit_id: units50.id, ingredient_id:ingredient201.id, quantity: 0.5)
proportions501 = sandwich.proportions.build(unit_id: nil, ingredient_id:ingredient202.id, quantity:1)
proportions502 = sandwich.proportions.build(unit_id: units53.id, ingredient_id:ingredient203.id, quantity: 0.5)
proportions503 = sandwich.proportions.build(unit_id: units54.id, ingredient_id:ingredient204.id, quantity:1)
proportions504 = sandwich.proportions.build(unit_id: nil, ingredient_id:ingredient205.id, quantity:1)
proportions505 = sandwich.proportions.build(unit_id: units54.id, ingredient_id:ingredient206.id, quantity:2)
proportions506 = sandwich.proportions.build(unit_id: units54.id, ingredient_id:ingredient207.id, quantity:1)
proportions507 = sandwich.proportions.build(unit_id: units55.id, ingredient_id:ingredient208.id, quantity: 0.5)
proportions508 = sandwich.proportions.build(unit_id: units50.id, ingredient_id:ingredient209.id, quantity: 0.25)
proportions509 = sandwich.proportions.build(unit_id: nil, ingredient_id:ingredient210.id, quantity:2)
proportions510 = sandwich.proportions.build(unit_id: nil, ingredient_id:ingredient211.id, quantity: 0.5)
proportions511 = sandwich.proportions.build(unit_id: units53.id, ingredient_id:ingredient212.id, quantity: 0.75)
proportions512 = sandwich.proportions.build(unit_id: nil, ingredient_id:ingredient213.id, quantity:2)
proportions513 = sandwich.proportions.build(unit_id: nil, ingredient_id:ingredient214.id, quantity:nil)
proportions514 = sandwich.proportions.build(unit_id: units54.id, ingredient_id:ingredient215.id, quantity:2)

step500 = sandwich.steps.build(description:'Preheat oven to 350°F with rack in middle.')
step501 = sandwich.steps.build(description:'Shred daikon and carrot in a food processor fitted with medium shredding disk. Stir together vinegar, sugar, and 1/2 teaspoon salt and toss with shredded vegetables. Let slaw stand, stirring occasionally, 15 minutes.
')
step502 = sandwich.steps.build(description:'Meanwhile, heat baguette on rack in oven until crusty, about 5 minutes. Cut off and discard round ends, then split baguette.
')
step503 = sandwich.steps.build(description:'Mix together oil, fish sauce, and soy sauce and brush on cut sides of bread. Spread liverwurst on bottom layer of bread and top with chiles, onion, and cilantro.
')
step504 = sandwich.steps.build(description:'Drain slaw in a colander.')
step505 = sandwich.steps.build(description:'Arrange chicken, slaw, and lettuce on cilantro. Spread top layer of bread with mayonnaise and cut sandwich crosswise into fourths.
')

sandwich.save


food_network_recipe = Recipe.new.create_recipe_from_food_network_adapter("http://www.foodnetwork.com/recipes/spicy-beef-chili-recipe.html")
food_network_recipe = Recipe.new.create_recipe_from_food_network_adapter("http://www.foodnetwork.com/recipes/ina-garten/herb-coeur-a-la-creme-recipe.html")
get_food_network_links = Adapters::FoodNetworkLinks.new.page_navigation
get_food_network_links.each do |link|
  @recipe = Recipe.new

  @recipe.create_recipe_from_food_network_adapter("http://www.foodnetwork.com#{link}")
end

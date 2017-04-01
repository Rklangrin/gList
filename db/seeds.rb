
User.create([
  { email: "rklandgren@gmail.com", password: "1234" },
  { email: "kevin@kevin.com", password: "1234" }
])

Meal.create([
  { name: "chicken parmesan", user_id: 1 },
  { name: "steak fried rice", user_id: 1 },
  { name: "eggplant parmesan", user_id: 2 },
  { name: "breakfast sandwich", user_id: 2 }
  ])

Ingredient.create([
  {name: "chicken breast", unit_type: "lb"},
  {name: "parmesan cheese", unit_type: "cup"},
  {name: "tomato sauce", unit_type: "oz"},
  {name: "basel", unit_type: "cup"},
  {name: "white rice", unit_type: "cup"},
  {name: "sirloin steak", unit_type: "lb"},
  {name: "soy sauce", unit_type: "tbl"},
  {name: "eggs", unit_type: "egg"},
  {name: "eggplant", unit_type: "eggplant"},
  {name: "bacon", unit_type: "slices"},
  {name: "avocado", unit_type: "avocado"},
  {name: "bread", unit_type: "slice"},
  {name: "ham", unit_type: "slice"}
  ])

MealItem.create([
  {ingredient_id: 1, meal_id: 1, quantity: 1},
  {ingredient_id: 2, meal_id: 1, quantity: 1},
  {ingredient_id: 3, meal_id: 1, quantity: 1},
  {ingredient_id: 4, meal_id: 1, quantity: 1},
  {ingredient_id: 5, meal_id: 2, quantity: 1},
  {ingredient_id: 6, meal_id: 2, quantity: 1},
  {ingredient_id: 7, meal_id: 2, quantity: 1},
  {ingredient_id: 8, meal_id: 2, quantity: 1},
  {ingredient_id: 10, meal_id: 2, quantity: 1},
  {ingredient_id: 8, meal_id: 4, quantity: 1},
  {ingredient_id: 11, meal_id: 4, quantity: 1},
  {ingredient_id: 10, meal_id: 4, quantity: 1}
])

List.create([
  { name: "basic", user_id: 1 },
  { name: "", user_id: 1 }
  ])

ListMeal.create([
  { list_id: 1, meal_id: 1},
  { list_id: 1, meal_id: 2},
  { list_id: 1, meal_id: 4}
  ])



require_relative '../config/environment.rb'

Item.destroy_all
User.destroy_all

vegetable1 = Item.create(item_name: "Broccoli", price: 2.99, category: "Vegetable")
vegetable2 = Item.create(item_name: "Peas", price: 1.99, category: "Vegetable")
vegetable3 = Item.create(item_name: "Zucchini", price: 1.99, category: "Vegetable")
vegetable4 = Item.create(item_name: "Green pepper", price: 2.99, category: "Vegetable")
vegetable5 = Item.create(item_name: "Onion", price: 0.99, category: "Vegetable")
vegetable6 = Item.create(item_name: "Spring Onion", price: 1.99, category: "Vegetable")
vegetable7 = Item.create(item_name: "Russet Potato", price: 0.69, category: "Vegetable")
vegetable8 = Item.create(item_name: "Butternut Squash", price: 1.69, category: "Vegetable")
vegetable9 = Item.create(item_name: "Yukon Potato", price: 1.99, category: "Vegetable")
vegetable10 = Item.create(item_name: "White Mushrooms", price: 1.99, category: "Vegetable")
vegetable11 = Item.create(item_name: "Sweet Onion", price: 1.99, category: "Vegetable")
vegetable12 = Item.create(item_name: "Lettuce", price: 1.99, category: "Vegetable")
vegetable13 = Item.create(item_name: "Kale", price: 1.99, category: "Vegetable")
vegetable14 = Item.create(item_name: "Cucumbers", price: 3.99, category: "Vegetable")
vegetable15 = Item.create(item_name: "Collards", price: 1.99, category: "Vegetable")
vegetable16 = Item.create(item_name: "Sweet Potatoes", price: 2.99, category: "Vegetable")
vegetable17 = Item.create(item_name: "Eggplant", price: 1.99, category: "Vegetable")

fruit1 = Item.create(item_name: "Blueberries", price: 3.99, category: "Fruit")
fruit2 = Item.create(item_name: "Bananas", price: 0.50, category: "Fruit")
fruit3 = Item.create(item_name: "Strawberries", price: 4.99, category: "Fruit")
fruit4 = Item.create(item_name: "Grapes", price: 4.99, category: "Fruit")
fruit5 = Item.create(item_name: "Passionfruit", price: 6.99, category: "Fruit")
fruit6 = Item.create(item_name: "Apples", price: 1.99, category: "Fruit")
fruit7 = Item.create(item_name: "Cantaloupe", price: 1.99, category: "Fruit")
fruit8 = Item.create(item_name: "Watermelon", price: 5.99, category: "Fruit")
fruit9 = Item.create(item_name: "Blackberries", price: 2.99, category: "Fruit")
fruit10 = Item.create(item_name: "Raspberries", price: 2.99, category: "Fruit")

meat1 = Item.create(item_name: "Lamb", price: 4.99, category: "Meat")
meat2 = Item.create(item_name: "Chicken", price: 2.99, category: "Meat")
meat3 = Item.create(item_name: "Beef", price: 3.99, category: "Meat")
meat4 = Item.create(item_name: "Steak", price: 14.99, category: "Meat")
meat5 = Item.create(item_name: "Salmon", price: 9.99, category: "Meat")
meat6 = Item.create(item_name: "Pork", price: 3.99, category: "Meat")

dairy1 = Item.create(item_name: "Milk", price: 2.99, category: "Dairy")
dairy2 = Item.create(item_name: "Cheese", price: 2.99, category: "Dairy")
dairy3 = Item.create(item_name: "Butter", price: 3.99, category: "Dairy")
dairy4 = Item.create(item_name: "Heavy Cream", price: 2.99, category: "Dairy")
dairy5 = Item.create(item_name: "Yogurt", price: 0.99, category: "Dairy")

groceryitem1 = Item.create(item_name: "Rice", price: 0.99, category: "Grocery")
groceryitem2 = Item.create(item_name: "Flour", price: 0.69, category: "Grocery")
groceryitem3 = Item.create(item_name: "Crackers", price: 1.99, category: "Grocery")
groceryitem4 = Item.create(item_name: "Cereal", price: 2.99, category: "Grocery")
groceryitem5 = Item.create(item_name: "Oatmeal", price: 0.99, category: "Grocery")
groceryitem6 = Item.create(item_name: "Pasta", price: 1.99, category: "Grocery")
groceryitem7 = Item.create(item_name: "Quinoa", price: 3.99, category: "Grocery")
groceryitem8 = Item.create(item_name: "Toilet Paper", price: 10.99, category: "Grocery")
groceryitem9 = Item.create(item_name: "Juice", price: 4.99, category: "Grocery")
groceryitem10 = Item.create(item_name: "Soda", price: 3.99, category: "Grocery")



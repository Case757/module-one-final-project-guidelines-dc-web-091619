require_relative '../config/environment'

puts "Welcome to E-List-It! Please enter your name"
user_name = gets.chomp
if User.names.include?(user_name)
    puts "Would you like to use a previous list?"
else
if  - "Would you like to use a previous list?" Yes - display list names
if user not found - Create list
Create list -
    puts Select a category of products 
    puts Vegetables, Fruits, Dairy, Meat, Grocery
    category_selection = gets.chomp

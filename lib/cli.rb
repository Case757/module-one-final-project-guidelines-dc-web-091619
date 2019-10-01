##Greet user and prompt for name##
def get_user_name
    puts "Welcome to E-List-It! Please enter your name"
    user_name = gets.chomp
end

def create_or_find_user(user_name)
    if User.names.include?(user_name)
        # puts "Would you like to use a previous list? Y/N"
        # user_input = gets.chomp
    else
        User.create(user_name)
    end
end

def choose_shopping_list
    puts "Would you like to create a new shopping list? Y/N"
    user_input = gets.chomp
    if user_input == "Y"
        List.create(create_or_find_user)
    else
        puts "Thank you for trying E-List-It"
        end_program
    end
end

def choose_option(list)
    puts "Choose an option"
    puts "1. Add item 2. Remove item 3. Print list 4. Total price"
    user_input = gets.chomp
    if user_input == "Add item"
        ListItem.create(item)
    elsif user_input == "Remove item"

    elsif user_input == "Print list"
        list.items.map {item| puts item.name}
    elsif user_input == "Total price"
        list.total_price
    else
        puts "That is not an opton, please choose again"
        choose_option
    end
end

    

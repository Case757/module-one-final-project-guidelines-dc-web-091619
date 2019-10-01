##Greet user and prompt for name##
require "tty-prompt"
$prompt = TTY::Prompt.new
$current_user = nil
$current_list = nil

def get_user_name
    puts "Welcome to E-List-It! Please enter your name"
    user_name = gets.chomp
end

def create_or_find_user(user_name)
    if User.names.include?(user_name)
        # puts "Would you like to use a previous list? Y/N"
        # user_input = gets.chomp
    else
        $current_user = User.create(name: user_name)
    end
end

def choose_shopping_list
    puts "Would you like to create a new shopping list? Y/N"
    user_input = gets.chomp

    if user_input == "Y"
        puts "Name your list."
        list_name = gets.chomp
        $current_list = List.create(name: list_name, user_id: $current_user.id)
    else
        return "Thank you for trying E-List-It"
    end
    
end



def choose_option
    # puts "1. Add item 2. Remove item 3. Print list 4. Total price"
    user_input = $prompt.select("Choose an option", ["Add item", "Remove item", "Print list", "Total price"])
    if user_input == "Add item"
        item_names = Item.all.map {|item| item.item_name}
        new_items = $prompt.multi_select("Please select items to add to list.", item_names)
        binding.pry

    elsif user_input == "Remove item"

    elsif user_input == "Print list"
        $current_list.items.map {|item| puts item.name}
    elsif user_input == "Total price"
        $current_list.total_price
    else
        puts "That is not an opton, please choose again"
        choose_option
    end
end

    

##Greet user and prompt for name##
require "tty-prompt"
class Cli
    attr_accessor :current_user, :current_list, :prompt
    @@prompt = TTY::Prompt.new

    def runner
        user_name = get_user_name
        new_user = create_or_find_user(user_name)
        choose_shopping_list
        user_input = choose_option
        choice_menu(user_input)
        
    end

    def choice_menu(user_input)
        
        case user_input
        when "Add item" 
            add_item(user_input)
            user_input = choose_option
            choice_menu(user_input)
        when "Remove item"
            remove_item(user_input)
            user_input = choose_option
            choice_menu(user_input)
        when "Print list"
            print_list(user_input)
            user_input = choose_option
            choice_menu(user_input)
        when "Total price"
            total_price(user_input)
            user_input = choose_option
            choice_menu(user_input)
        when "Exit E-List-It"
            exit_list(user_input)
        end  
    end

    def get_user_name
        puts "Welcome to E-List-It! Please enter your name"
        user_name = gets.chomp
    end

    def create_or_find_user(user_name)
        if User.names.include?(user_name)
            # puts "Would you like to use a previous list? Y/N"
            # user_input = gets.chomp
        else
            self.current_user = User.create(name: user_name)
        end
    end

    def choose_shopping_list
        user_input = @@prompt.yes?('Would you like to create a new shopping list?')

        if user_input == true
            puts "Name your list."
            list_name = gets.chomp
            self.current_list = List.create(name: list_name, user_id: self.current_user.id) 

        elsif user_input == false
            puts "Thank you for trying E-List-It"
            exit!
        end
    end

    def choose_option
        user_input = @@prompt.select("Choose an option", ["Add item", "Remove item", "Print list", "Total price", "Exit E-List-It"])
    end

    def add_item(user_input)
        if  user_input == "Add item"
            
            item_names = Item.all.map {|item| item.item_name}
            new_items = @@prompt.multi_select("Please select items to add to list.", item_names)

    
            new_items.each do |item|
                this_item = Item.find_by(item_name: item)
                ListItem.create(item_id: this_item.id, list_id: self.current_list.id)
            end
        end
        puts "Your list has been updated"
    end

    def remove_item(user_input)
        if user_input == "Remove item"
            
            test_array = ListItem.all.map {|li| li.list_id}
            
            if test_array.include?(self.current_list.id)
                remove_items = @@prompt.multi_select("Please select items to remove from list.", self.current_list.items.map {|item| item.item_name})

                remove_items.each do |item|
                    this_item = Item.find_by(item_name: item)
                    
                    ListItem.destroy_by(item_id: this_item.id, list_id: self.current_list.id)
                end

                puts "Your list has been updated"
                self.current_list.reload

            else
                puts "There are no items on your list, please create a list."          
            end
        end
    end

    def print_list(user_input)
        if user_input == "Print list"
            
            self.current_list.items.map do |item| 
                puts item.item_name
            end
        end
    end

    def total_price(user_input)
        if user_input == "Total price"
            puts "The items in your list total to $#{self.current_list.total_price}."
        end
    end

    def exit_list(user_input)
        if user_input == "Exit E-List-It"
            puts "********************************"
            puts "See ya."
            puts "********************************"
        end
    end

    def print_items_added(array)
        puts "These items have been added to your shopping list:"
        array.each do |item|
            puts item
        end
    end
end

    

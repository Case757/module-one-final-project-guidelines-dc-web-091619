##Greet user and prompt for name##
require "tty-prompt"
class Cli
    attr_accessor :current_user, :current_list, :prompt
    @@prompt = TTY::Prompt.new

    ##----------Run the program----------##

    def runner
        user_name = get_user_name
        new_user = create_or_find_user(user_name)
        choose_shopping_list
        user_input = choose_option
        choice_menu(user_input)
    end

    ##----------Interprets choice menu----------##

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
        
        when "Choose another list"
            choose_another_list(user_input)
            user_input = choose_option
            choice_menu(user_input)
        
        when "Create a new list"
            create_new_list(user_input)
            user_input = choose_option
            choice_menu(user_input)
       
        when "Exit E-List-It"
            exit_list(user_input)
        end  
    end

    ##----------Gets user name----------##


    def get_user_name
        puts "_______________________________"
        puts "Welcome to E-List-It! Please enter your name"
        puts "_______________________________"
        user_name = gets.chomp
    end

    def pick_list
        list_names = self.current_user.lists.map {|list| list.name}

        if list_names.length == 0
            "You don't have any stored lists. Please choose another option."
            self.choose_shopping_list #####added self
        else
            user_lists = List.find_by(user_id: current_user.id)
            user_input = @@prompt.select("Pick a list", list_names)
            selected_list = List.find_by(name: user_input)
            self.current_list = selected_list
        end
    end

    ##----------Create or find user - update user_name variable----------##


    def create_or_find_user(user_name)
        if User.names.include?(user_name)

            self.current_user = User.find_by(name: user_name)

        else
            self.current_user = User.create(name: user_name)
        end
    end

    def use_previous_list?

        user_input = @@prompt.select('Would you like to use a previous list?', ["Yes", "No"])

            if user_input == "Yes"
              self.pick_list ######added self
            else
                self.current_user = User.find_by(name: user_name)
            end
    end

    def choose_shopping_list
        
        if self.current_list
            self.current_list
        else 
            user_input = @@prompt.select('Would you like to create a new shopping list?',["Yes", "No"])

            if user_input == "Yes"
                self.create_new_list(user_input) ####added self

            elsif user_input == "No"
                puts "_______________________________"
                puts "Thank you for trying E-List-It"
                puts "_______________________________"
                exit!
            end
        end
    end

    ##---------- Choose option prompt ----------##


    def choose_option
        if self.current_list 
            user_input = @@prompt.select("Your current list is #{self.current_list.name}. Choose an option:", ["Add item", "Remove item", "Print list", "Total price", "Choose another list", "Create new a list", "Exit E-List-It"])
        else
            user_input = @@prompt.select("Choose an option:", ["Add item", "Remove item", "Print list", "Total price", "Choose another list", "Create new a list", "Exit E-List-It"])
        end
    end

    ##---------- Add item option ----------##


    def add_item(user_input)
        binding.pry
        if  user_input == "Add item"
            
            item_names = Item.all.map {|item| item.item_name}
            new_items = @@prompt.multi_select("Please select items to add to list.", item_names)

    
            new_items.each do |item|
                this_item = Item.find_by(item_name: item)
                ListItem.create(item_id: this_item.id, list_id: self.current_list.id)
            end
        end
        puts "_______________________________"
        puts "Your list has been updated"
        puts "_______________________________"
    end

    ##---------- Remove item option ----------##


    def remove_item(user_input)
        if user_input == "Remove item"
            
            test_array = ListItem.all.map {|li| li.list_id}
            
            if test_array.include?(self.current_list.id)
                remove_items = @@prompt.multi_select("Please select items to remove from list.", self.current_list.items.map {|item| item.item_name})

                remove_items.each do |item|
                    this_item = Item.find_by(item_name: item)
                    
                    ListItem.destroy_by(item_id: this_item.id, list_id: self.current_list.id)
                end

                puts "_______________________________"
                puts "Your list has been updated"
                puts "_______________________________"
                self.current_list.reload

            else
                puts "_______________________________"
                puts "There are no items on your list, please create a list."          
                puts "_______________________________"
            end
        end
    end

    ##---------- Print list option ----------##


    def print_list(user_input)
        if user_input == "Print list"
            puts "_______________________________"
            puts "#{self.current_list.name} includes: \n"
            puts "_______________________________"
            self.current_list.items.map do |item| 
                puts item.item_name
            end
            puts "_______________________________"
        end
    end

    ##---------- Total price option----------##


    def total_price(user_input)
        if user_input == "Total price"
            puts "The items in your list total to $#{self.current_list.total_price}"
        end
    end

    ##---------- Choose another list option ---------##


    def choose_another_list(user_input)
        if user_input == "Choose another list"
            self.pick_list
        end
    end

    ##---------- Create a new list option ---------##

    def create_new_list(user_input)
            puts "_______________________________"
            puts "Name your list."
            puts "_______________________________"
            list_name = gets.chomp
            self.current_list = List.create(name: list_name, user_id: self.current_user.id) 
            
    end

    ##---------- Exist list option ----------##


    def exit_list(user_input)
        if user_input == "Exit E-List-It"
            puts "_______________________________"
            puts "Thank you for using E-List-It."
            puts "_______________________________"
        end
    end

    ##---------- Print items that have been added ----------##


    def print_items_added(array)
        puts "_______________________________"
        puts "These items have been added to your shopping list:"
        array.each do |item|
            puts item
        end
        puts "_______________________________"
    end
end

    

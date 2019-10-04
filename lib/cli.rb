##Greet user and prompt for name##
require "tty-prompt"

class Cli

    attr_accessor :current_user, :current_list
    @@prompt = TTY::Prompt.new

    ##----------Run the program----------##

    def runner
        system "clear"
        create_or_find_user(get_user_name)
        choose_shopping_list
        choice_menu(choose_option)
    end

    ##----------Gets user name----------##

    def get_user_name
        puts "_______________________________"
        puts "Welcome to Listy! Please enter your name"
        puts "_______________________________"
        user_name = gets.chomp
    end

    ##----------Create or find user - update user_name variable----------##

    def create_or_find_user(user_name)
        system "clear"

        if User.names.include?(user_name)
            self.current_user = User.find_by(name: user_name)
            use_previous_list?
        else
            self.current_user = User.create(name: user_name)
        end
    end

    def use_previous_list?
        system "clear"

        user_input = @@prompt.select('Would you like to use a previous list?', ["Yes", "No"])

        if user_input == "Yes"
            pick_list
        else
            create_new_list
        end
    end

    def pick_list
        system "clear"

        self.current_user.reload
        list_names = self.current_user.lists.map {|list| list.name}

        if list_names.length == 0
            "You don't have any stored lists. Please choose another option."
            self.choose_shopping_list
        else
            user_lists = List.find_by(user_id: current_user.id)
            user_input = @@prompt.select("Pick a list", list_names)
            selected_list = List.find_by(name: user_input)
            self.current_list = selected_list
        end
    end

    def choose_shopping_list
        system "clear"

        if self.current_list
            self.current_list
        else 
            user_input = @@prompt.select('Would you like to create a new shopping list?',["Yes", "No"])

            if user_input == "Yes"
                self.create_new_list

            elsif user_input == "No"
                puts "_______________________________"
                puts "Thank you for trying Listy"
                puts "_______________________________"
                exit!
            end
        end
    end

    ##---------- Create a new list option ---------##

    def create_new_list
        system "clear"

        puts "_______________________________"
        puts "Name your list."
        puts "_______________________________"
        list_name = gets.chomp
        self.current_list = List.create(name: list_name, user_id: self.current_user.id)     
    end

    ##---------- Choose option prompt ----------##


    def choose_option
        if self.current_list 
            user_input = @@prompt.select("Your current list is #{self.current_list.name}. Choose an option:", ["Add item", "Remove item", "Print list", "Total price", "Choose another list", "Create a new list", "Exit Listy"])
        else
            user_input = @@prompt.select("Choose an option:", ["Add item", "Remove item", "Print list", "Total price", "Choose another list", "Create a new list", "Exit Listy"])
        end
    end
    
    ##----------Interprets choice menu----------##

    def choice_menu(user_input)
        case user_input

        when "Add item" 
            add_item
            choice_menu(choose_option)

        when "Remove item"
            remove_item
            choice_menu(choose_option)

        when "Print list"
            print_list
            choice_menu(choose_option)

        when "Total price"
            total_price
            choice_menu(choose_option)
        
        when "Choose another list"
            choose_another_list
            choice_menu(choose_option)
        
        when "Create a new list"
            create_new_list 
            choice_menu(choose_option)
       
        when "Exit Listy"
            exit_list
        end  
    end

    ##---------- Add item option ----------##

    def add_item
        system "clear"

        item_names = Item.all.map {|item| item.item_name}
        new_items = @@prompt.multi_select("Please select items to add to list. Scroll down for more options.", item_names, per_page: 15)

        new_items.each do |item|
            this_item = Item.find_by(item_name: item)
            ListItem.create(item_id: this_item.id, list_id: self.current_list.id)
        end
        
        puts "_______________________________"
        puts "Your list has been updated"
        puts "_______________________________"
        self.current_list.reload
    end

    ##---------- Remove item option ----------##

    def remove_item
        system "clear"

        test_array = ListItem.all.map {|li| li.list_id}
        
        if test_array.include?(self.current_list.id)
            items_to_remove = @@prompt.multi_select("Please select items to remove from list.\nScroll down for more options", self.current_list.items.map {|item| item.item_name}, per_page: 15)

            items_to_remove.each do |item|
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

    ##---------- Print list option ----------##

    def print_list  
        system "clear"

        puts "_______________________________"
        puts "#{self.current_list.name} includes: \n"
        puts "_______________________________"

        self.current_list.items.map do |item| 
            puts item.item_name
        end

        puts "_______________________________"
    end

    ##---------- Total price option----------##

    def total_price
        system "clear"

        puts "_______________________________"
        puts "The items in your list total to $#{self.current_list.total_price}"
        puts "_______________________________"
    end

    ##---------- Choose another list option ---------##

    def choose_another_list
        system "clear"

        self.pick_list
    end 

    ##---------- Exist list option ----------##

    def exit_list
        system "clear"

        puts "_______________________________"
        puts "Thank you for using Listy."
        puts "_______________________________"
    end

end
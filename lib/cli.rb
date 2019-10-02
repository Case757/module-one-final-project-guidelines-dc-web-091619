##Greet user and prompt for name##
require "tty-prompt"
class Cli
    @@prompt = TTY::Prompt.new
    @@current_user = nil
    @@current_list = nil

    def self.current_user
        @@current_user
    end

    def self.current_user=(a)
        @@current_user = a
    end

    def self.current_list
        @@current_list
    end

    def self.current_list=(a)
        @@current_list = a
    end

    def self.prompt
        @@prompt
    end

    def self.get_user_name
        puts "Welcome to E-List-It! Please enter your name"
        user_name = gets.chomp
    end

    def self.create_or_find_user(user_name)
        if User.names.include?(user_name)
            # puts "Would you like to use a previous list? Y/N"
            # user_input = gets.chomp
        else
            self.current_user = User.create(name: user_name)
        end
    end

    def self.choose_shopping_list
        ##refactor to use prompt gem instead of getting user input
        puts "Would you like to create a new shopping list? Y/N"
        user_input = gets.chomp

        if user_input == "Y"
            puts "Name your list."
            list_name = gets.chomp
            self.current_list = List.create(name: list_name, user_id: self.current_user.id)
            
        else
            return "Thank you for trying E-List-It"
        end
    end



    def self.choose_option
        # puts "1. Add item 2. Remove item 3. Print list 4. Total price"
        user_input = prompt.select("Choose an option", ["Add item", "Remove item", "Print list", "Total price", "Exit E-List-It"])

        if user_input == "Add item"
            
            item_names = Item.all.map {|item| item.item_name}
            new_items = prompt.multi_select("Please select items to add to list.", item_names)

            
            new_items.each do |item|
                this_item = Item.find_by(item_name: item)
                
                ListItem.create(item_id: this_item.id, list_id: self.current_list.id)
            end

            puts "Your list has been updated"
            choose_option


        elsif user_input == "Remove item"
            
            test_array = ListItem.all.map {|li| li.list_id}
            
            if test_array.include?(self.current_list.id)
                remove_items = prompt.multi_select("Please select items to remove from list.", self.current_list.items.map {|item| item.item_name})

                remove_items.each do |item|
                    this_item = Item.find_by(item_name: item)
                    
                    ListItem.destroy_by(item_id: this_item.id, list_id: self.current_list.id)
                end

                puts "Your list has been updated"
                self.current_list.reload
                choose_option

                

            else
                puts "There are no items on your list, please create a list."
                choose_option            
            end

        elsif user_input == "Print list"
            
            self.current_list.items.map do |item| 
                puts item.item_name
            end
            choose_option

        elsif user_input == "Total price"
            puts "The items in your list total to $#{self.current_list.total_price}."
            choose_option

        elsif user_input == "Exit E-List-It"
            puts "********************************"
            puts "See ya."
            puts "********************************"
        end
    end

    def self.print_items_added(array)
        puts "These items have been added to your shopping list:"
        array.each do |item|110
            puts item
        end
    end
end

    

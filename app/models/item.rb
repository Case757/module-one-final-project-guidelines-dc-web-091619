class Item < ActiveRecord::Base
    has_many :list_items
    has_many :lists, through :list_items
    
    def initalize(item_name, price)
        @item_name = item_name
        @price = price
    end
    
end
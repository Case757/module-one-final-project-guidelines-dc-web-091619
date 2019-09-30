def Item
    has_many :list_items
    has_many :lists, through :list_items

    attr_reader :item_name, price
    
    def initalize(item_name, price)
        @item_name = item_name
        @price = price
    end
    
end
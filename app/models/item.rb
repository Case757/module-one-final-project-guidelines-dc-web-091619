def Item
    has_many :list_item
    has_many :list, through :list_item

    attr_reader :item_name, price
    
    def initalize(item_name, price)
        @item_name = item_name
        @price = price
    end
    
end
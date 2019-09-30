class ListItem 
    belongs_to :item
    belongs_to :list

    def initialize(item, list)
        @item = item
        @list = list
    end
end
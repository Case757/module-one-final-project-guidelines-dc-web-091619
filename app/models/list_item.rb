class ListItem < ActiveRecord::Base
    belongs_to :items
    belongs_to :lists

    def initialize(item, list)
        @item = item
        @list = list
    end
end
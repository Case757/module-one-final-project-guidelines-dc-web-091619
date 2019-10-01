class List < ActiveRecord::Base
    has_many :list_items
    has_many :items, through: :list_items
    belongs_to :user

    def total_price
        self.items.map {|item| item.price}.sum
    end
end
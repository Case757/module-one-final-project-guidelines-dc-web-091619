class User < ActiveRecord::Base
    has_many :lists
    has_many :list_items, through: :lists

    def self.names
        User.all.map {|user| user.name}
    end
    
end
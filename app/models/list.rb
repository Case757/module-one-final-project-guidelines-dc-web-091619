class List < ActiveRecord::Base
    has_many :list_items
    has_many :items, through :list_items
    belongs_to :user



    def initialize(user)
        @user = user
    end

end
class User < ActiveRecord::Base
    has_many :lists
 
    def initialize(name)
        @name = name
    end

end
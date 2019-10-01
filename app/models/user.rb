class User < ActiveRecord::Base
    has_many :lists
 
    def initialize(name)
        @name = name
    end

    this is a test to see if we get git.

end
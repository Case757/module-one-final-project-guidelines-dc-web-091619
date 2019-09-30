class User
    has_many :list
    attr_reader :name
    def initialize(name)
        @name = name
    end

end
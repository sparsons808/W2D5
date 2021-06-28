class Item

    attr_accessor :title, :description
    attr_reader :deadline

    def self.valid_date?(date_str)
        month = ('01'..'12').to_a
        day = ('01'..'31').to_a

        if month.include?(date_str[5..6]) && day.include?(date_str[-2..-1])
            return true
        else
            return false
        end
    end

    def initialize(title, deadline, description='')
        if Item.valid_date?(deadline)
            @deadline = deadline
        else
            raise 'error invalid date try entering YYYY-MM-DD'
        end

        @title = title
        @description = description
    end

    def deadline=(new_deadline)
        if Item.valid_date?(new_deadline)
            @deadline = new_deadline
        else
            raise 'error invalid date try entering YYYY-MM-DD'
        end
    end
    

end
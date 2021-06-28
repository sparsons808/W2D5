require '/Users/sydneyparsons/Documents/App_Academy_Work/W2/w2d5/todo/item.rb'

class List

    attr_accessor :label

    def initialize(label)
        @label = label
        @items = []
    end

    def add_item(title, deadline, description='')
        if Item.valid_date?(deadline)
            item = Item.new(title, deadline, description)
            @items.push(item)
            return true
        else
            return false
        end
    end

    def size
        @items.length
    end

    def valid_index?(idx)
        if idx >= 0 && idx < @items.length
            return true
        else
            return false
        end
    end

    def swap(idx_1, idx_2)
        if valid_index?(idx_1.to_i) && valid_index?(idx_2.to_i)
            @items[idx_1], @items[idx_2] = @items[idx_2], @items[idx_1]
            return true
        else
            return false
        end
    end

    def [](idx)
        if valid_index?(idx)
            return @items[idx]
        else
            return nil
        end
    end

    def priority
        return @items.first
    end

    def print
        puts @label
        @items.each_with_index do |item, i|
            puts "#{i}   |#{item.title}     |#{item.deadline}"
        end
    end

    def print_full_item(idx)
        if valid_index?(idx)
            print "-----------------------------------"
            puts
            print @items[idx].title + "                " + @items[idx].deadline
            puts
            print @items[idx].description
            puts
            print "-----------------------------------"
        end
    end

    def print_first
        first_item = @items.first
        print "-----------------------------------"
        puts
        print first_item.title + "                " + first_item.deadline
        puts
        print first_item.description
        puts
        print "-----------------------------------"
    end

    def up(index, amount=1)
        if valid_index?(index)
            i = index

            while amount > 0
                if @items[index] != @items[0]
                    @items[index], @items[index - 1] = @items[index - 1], @items[index]
                end
                i -= 1
                amount -= 1
            end
            return true
        else
            return false
        end
    end

    def down(index, amount=1)
        if valid_index?(index)
            i = index

            while amount > 0
                if @items[index] != @items[-1]
                    @items[index], @items[index + 1] = @items[index + 1], @items[index]
                end
                i += 1
                amount -= 1
            end
            return true
        else
            return false
        end
    end

    def sort_by_date!
        @items.sort_by! { |item| item.deadline }
    end


end
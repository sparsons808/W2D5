require "/Users/sydneyparsons/Documents/App_Academy_Work/W2/w2d5/todoself.rb"

class TodoBoard

    def initializeself(label)
        @label = List.new(label)
    end

    def get_command
        print "\nEnter a command: "
        cmd, command = gets.chomp

        case cmd
        when 'mktodo'

            print "\n Enter item title, deadline, and description: "
            item = gets.chomp.split(' ')
            self.add_item(*item)

        when 'up'

            print "\n Enter item index: "
            idx = gets.chomp.to_i
            self.up(idx)

        when 'down'
            print "\n Enter item index: "
            idx = gets.chomp.to_i
            self.down(idx)

        when 'swap'
            print "\n Enter two items indexes: "
            *idx = gets.chomp.split(' ')
            self.swap(*idx)

        when 'sort'
            self.sort_by_date!

        when 'priority'
            self.priority

        when 'print'
            print "\n Enter item index for specific item else press enter: "
            idx = gets.chomp
            if idx != ""
                self[idx.to_i]
            else
                self.print
            end

        when 'quit'
            return false
        else
            print "Command not recognized"
        end

        true
    end

    def run
        running = true
        while running
            self.get_command
        end
    end
end
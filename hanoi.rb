class Hanoi

    #lets us check the size and state of the current game
    attr_reader :pegs, :discs

    def initialize(options = {discs: 4 })
        #set the number of discs to instance variables
        @discs = options[:discs]

        #make a hash of pegs
        @pegs = {
            :from => [],
            :to => [],
            :pivot => []
        }

        #make a peg array
        @pegs_array = [@pegs[:from], @pegs[:to], @pegs[:pivot]]

        #build a tower of discs
        @discs.downto(1) do |disc|
            #add them to the starting peg
            @pegs[:from] << disc
        end
    end

    def shift(pegs={})
        #this is going to handle our peg shifting procedure
        pegs[:to] << pegs[:from].delete_at(pegs[:from].length-1)
    end

    def move(n, pegs={})
        #this will handle our legal move procedure
        #(note: this is the recursive call)
        
        #if n is more than one ...
        if n > 1

            #recursively call on one less than the starting disc amount
            #thus making the problem solve a smaller version of the problem
            #before solving the larger one.

            #magic switchery
            move((n-1), {:from => pegs[:from], :to => pegs[:pivot], :pivot => pegs[:to]})
        end

        #call our shift action
        shift({:from => pegs[:from], :to => pegs[:to]})

        print_state
        #recursive call again, but with shifted pegs

        if n > 1
            move((n-1), :from => pegs[:pivot], :to => pegs[:to], :pivot => pegs[:from])
        end
    end

    def print_state
        @pegs_array.each_with_index do |peg, peg_number|
            print "Peg #{peg_number} : "
            peg.each do |disc|
                print disc.to_s+", "
            end
            print "\n"
        end
    end

    def solve
        print_state

        move(@discs, @pegs)

        print_state
    end

end
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

end
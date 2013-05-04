module GameOfLife
  class Generation < Array

    attr_accessor :evolution

    def initialize
      @evolution = Evolution.new(self)
    end

    def evolve!
      @evolution.new_generation
    end

  end
end

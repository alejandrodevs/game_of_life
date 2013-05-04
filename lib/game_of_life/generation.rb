module GameOfLife
  class Generation < Array

    def initialize
      @evolution = Evolution.new(self)
    end

    def evolve!
      @evolution.new_generation
    end

  end
end

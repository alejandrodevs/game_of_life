module GameOfLife
  class Generation < Array

    def initialize
      Seed.new(self).load!
    end

    def evolve!
      Evolution.new(self).new_generation
    end

    def print!
      Printable.new(self).print!
    end

  end
end

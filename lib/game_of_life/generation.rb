module GameOfLife
  class Generation < Hash

    def initialize
      Seed.new(self).load!
    end

    def evolve!
      Evolution.new(self).next!
    end

    def print!
      Printable.new(self).print!
    end

  end
end

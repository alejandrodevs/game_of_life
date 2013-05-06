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

    def add cell, pos
      merge!(:"p#{pos[0]}_#{pos[1]}" => cell)
    end

    def get pos
      send(:[], :"p#{pos[0]}_#{pos[1]}")
    end

  end
end

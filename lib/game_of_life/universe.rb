module GameOfLife
  class Universe

    def initialize
      @generation = Generation.new
    end

    def evolve
      @generation.evolve!
    end

    def print
      @generation.print!
    end

  end
end

module GameOfLife
  class Universe

    attr_accessor :generation

    def initialize
      @generation = Generation.new
    end

    def evolve
      @generation.evolve!
    end

  end
end

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

    def start
      while 1
        system("clear")
        print
        sleep(1)
        evolve
      end
    end

  end
end

module GameOfLife
  class Cell

    RULES = [[0,0,0,1,0,0,0,0,0], [0,0,1,1,0,0,0,0,0]]

    attr_accessor :status, :posx, :posy

    def initialize position, status = 0
      @posx, @posy = position
      @status = status
    end

    def neighbors
      @neighbors ||= Neighbors.new
    end

    def alive?
      @status == 1
    end

    def mitosis!
      @status = RULES[status][neighbors.alive]
    end

  end
end

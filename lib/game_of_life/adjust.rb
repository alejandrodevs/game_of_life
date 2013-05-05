module GameOfLife
  class Adjust

    def initialize generation
      @generation = generation
    end

    def adjust
      @generation.each do |cell|
        adjust_neighborhood(cell) if cell.alive?
      end
    end

    def adjust_neighborhood cell
      cell.neighbors.positions.each do |pos|
        adjust_neighbors(cell, pos) if cell.neighbors[pos].nil?
      end
    end

    def adjust_neighbors cell, pos

    end

  end
end

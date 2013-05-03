module GameOfLife
  class Adjustment

    attr_accessor :generation

    def initialize generation
      @generation = generation
    end

    def adjust
      generation.each do |cell|
        adjust_cell_neighborhood(cell)
      end
    end

    def adjust_cell_neighborhood cell
      cell.neighbors_positions.each do |pos|
        adjust_neighbor(cell, pos) if cell.send(pos).nil?
      end
    end

    def adjust_neighbor cell, pos

    end

  end
end

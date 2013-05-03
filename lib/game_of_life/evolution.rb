module GameOfLife
  class Evolution

    attr_accessor :generation

    def initialize generation
      @generation = generation
    end

    def new_generation
      evolution
      adjustment
      generation
    end

    def statuses
      @statuses ||= generation.map(&:dup).map(&:mitosis)
    end

    def evolution
      generation.each_with_index do |cell, x|
        cell.status = statuses[x]
      end
    end

    def adjustment
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

module GameOfLife
  class CellLinker

    attr_accessor :generation

    def initialize generation
      @generation = generation
    end

    def link!
      generation.values.each{ |c| link_neighborhood(c) }
    end

    def link_neighborhood cell
      cell.neighbors.positions.each do |pos|
        link_cell(cell, pos) unless cell.neighbors[pos]
      end
    end

    def link_cell cell, pos
      position = coordinates(cell)[pos]
      neighbor = generation.get(position)

      if neighbor.nil? && cell.alive?
        neighbor = Cell.new(position, 0)
        generation.add(neighbor, position)
      end

      cell.neighbors.add(neighbor, pos) if neighbor
    end

    def coordinates cell
      {
        :n  => [cell.posx, cell.posy + 1],
        :s  => [cell.posx, cell.posy - 1],
        :e  => [cell.posx - 1, cell.posy],
        :w  => [cell.posx + 1, cell.posy],
        :nw => [cell.posx + 1, cell.posy + 1],
        :ne => [cell.posx - 1, cell.posy + 1],
        :sw => [cell.posx + 1, cell.posy - 1],
        :se => [cell.posx - 1, cell.posy - 1]
      }
    end

  end
end

module GameOfLife
  class CellLinker

    attr_accessor :generation

    def initialize generation
      @generation = generation
    end

    def link!
      generation.each{ |c| link_neighborhood(c) }
    end

    def link_neighborhood cell
      cell.neighbors.positions.each{ |pos| link_cell(cell, pos) }
    end

    def link_cell cell, pos
      neighbor = neighbor?(cell, pos)
      cell.neighbors.add(neighbor, pos) if neighbor
      add_new_neighbor(cell, pos) if neighbor.nil? && cell.alive?
    end

    def add_new_neighbor cell, pos
      neighbor = Cell.new(coordinates(cell)[pos], 0)
      cell.neighbors.add(neighbor, pos)
      generation << neighbor
    end

    def neighbor? cell, pos
      cell?(coordinates(cell)[pos])
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

    def cell? pos
      generation.detect{ |c| [c.posx, c.posy] == pos }
    end

  end
end

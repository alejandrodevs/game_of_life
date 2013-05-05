module GameOfLife
  class Printable

    attr_accessor :generation, :grid

    def initialize generation
      @generation = generation

      initialize_grid
      populate_grid
    end

    def min_posx
      @min_posx ||= generation.map(&:posx).min
    end

    def max_posx
      @max_posx ||= generation.map(&:posx).max
    end

    def min_posy
      @min_posy ||= generation.map(&:posy).min
    end

    def max_posy
      @max_posy ||= generation.map(&:posy).max
    end

    def height
      (max_posy - min_posy) + 1
    end

    def width
      (max_posx - min_posx) + 1
    end

    def initialize_grid
      @grid = Array.new(height){ |c| Array.new(width) }
    end

    def populate_grid
      generation.each do |c|
        grid[c.posy + min_posy.abs][c.posx + min_posx.abs] = grid_item(c)
      end
    end

    def grid_item cell
      cell.status == 1 ? "1" : "0"
    end

    def print!
      puts grid.map{ |r| r.map{ |e| e.nil? ? " " : e  }.join }.join("\n")
    end

  end
end

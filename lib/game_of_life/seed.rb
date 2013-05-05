module GameOfLife
  class Seed

    DEFAULT_SEED = "game_of_life/seeds/default.txt"

    attr_accessor :generation, :grid

    def initialize generation
      @generation = generation
    end

    def file
      File.open(DEFAULT_SEED, "r")
    end

    def lines
      file.read.split("\n")
    end

    def height
      lines.count
    end

    def width
      lines.first.split("").count
    end

    def initialize_grid
      @grid ||= Array.new(width){ |r| Array.new(height) }
    end

    def populate_grid
      lines.each_with_index do |line, y|
        cells = line.split("")
        cells.each_index{ |x| grid[x][y] = cells[x] }
      end
    end

    def populate_generation
      (0...width).each do |x|
        (0...height).each do |y|
          generation << Cell.new([x, y], grid[x][y].to_i)
        end
      end
    end

    def link_cells

    end

    def load!
      initialize_grid
      populate_grid
      populate_generation
      link_cells
    end

  end
end

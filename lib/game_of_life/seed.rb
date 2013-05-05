module GameOfLife
  class Seed

    DEFAULT_SEED = "game_of_life/seeds/default.txt"

    attr_accessor :generation, :grid

    def initialize generation
      @generation = generation
      @grid = Array.new(height){ |r| Array.new(width) }
    end

    def lines
      File.open(DEFAULT_SEED, "r").read.split("\n")
    end

    def height
      lines.count
    end

    def width
      lines.first.split("").count
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
          generation.merge!(generation_cell(x, y))
        end
      end
    end

    def generation_cell x, y
      {:"p#{x}_#{y}" => Cell.new([x, y], grid[x][y].to_i)}
    end

    def load!
      populate_grid
      populate_generation
      CellLinker.new(generation).link!
    end

  end
end

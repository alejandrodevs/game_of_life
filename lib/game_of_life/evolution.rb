module GameOfLife
  class Evolution

    attr_accessor :generation

    def initialize generation
      @generation = generation
    end

    def new_generation
      evolution
      adjustment
    end

    def evolution
      generation.values.each_with_index do |cell, x|
        cell.status = statuses[x]
      end
    end

    def adjustment
      CellLinker.new(generation).link!
    end

    def statuses
      @statuses ||= generation.values.map(&:dup).map(&:mitosis!)
    end

  end
end

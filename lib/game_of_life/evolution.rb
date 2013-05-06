module GameOfLife
  class Evolution

    attr_accessor :generation

    def initialize generation
      @generation = generation
    end

    def next!
      evolution
      CellLinker.new(generation).link!
    end

    def evolution
      generation.values.each_with_index do |cell, x|
        cell.status = statuses[x]
      end
    end

    def statuses
      @statuses ||= generation_dup.map(&:mitosis!)
    end

    def generation_dup
      generation.values.map(&:dup)
    end

  end
end

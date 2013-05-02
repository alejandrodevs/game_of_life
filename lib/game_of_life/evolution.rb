module GameOfLife
  class Evolution

    attr_accessor :generation

    def initialize generation
      @generation = generation
    end

    def new_generation
      evolution
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

  end
end

module GameOfLife
  class AdjustGeneration

    attr_accessor :generation

    def initialize generation
      @generation = generation
    end

    def adjust
      generation.each do |cell|
        AdjustCell.new(cell).adjust
      end
    end

  end
end

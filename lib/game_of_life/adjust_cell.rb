module GameOfLife
  class AdjustCell

    attr_accessor :cell

    def initialize cell
      @cell = cell
    end

    def adjust
      adjust_neighborhood if @cell.alive?
    end

    def adjust_neighborhood
      @cell.neighbors_positions.each do |pos|

      end
    end

  end
end

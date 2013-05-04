module GameOfLife
  class Cell

    RULES = [[0,0,0,1,0,0,0,0,0], [0,0,1,1,1,0,0,0,0]]

    attr_accessor :status, :posx, :posy
    attr_accessor :n, :s, :e, :w, :ne, :nw, :se, :sw

    def initialize position, status = 0
      @posx, @posy = position
      @status = status
    end

    def neighbors_positions
      [:n, :nw, :w, :sw, :s, :se, :e, :ne]
    end

    def neighbors_ids
      neighbors_positions.map{ |p| send(p) }.compact
    end

    def neighbors
      neighbors_ids.map{ |i| ObjectSpace._id2ref(i) }
    end

    def neighbors_alive
      neighbors.map(&:status).reduce(&:+)
    end

    def neighbor position
      ObjectSpace._id2ref(send(position).to_i)
    end

    def neighbor_link cell, position
      send(:"#{position.to_s}=", cell.object_id)
    end

    def alive?
      @status == 1
    end

    def mitosis!
      @status = RULES[status][neighbors_alive]
    end

  end
end

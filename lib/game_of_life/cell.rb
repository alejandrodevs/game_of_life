module GameOfLife
  class Cell

    RULES = [[0,0,0,1,0,0,0,0,0], [0,0,1,1,1,0,0,0,0]]

    attr_accessor :n, :s, :e, :w, :ne, :nw, :se, :sw, :status

    def initialize status = 0
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

    def add_neighbor neighbor, position
      send(:"#{position.to_s}=", neighbor.object_id)
    end

    def mitosis
      @status = RULES[status][neighbors_alive]
    end

  end
end

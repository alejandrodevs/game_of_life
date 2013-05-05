module GameOfLife
  class Neighbors < Hash

    def [] pos
      instance(fetch(pos){})
    end

    def positions
      [:n, :nw, :w, :sw, :s, :se, :e, :ne]
    end

    def instances
      values.map{ |c| instance(c) }
    end

    def alive
      instances.map(&:status).reduce(&:+).to_i
    end

    def add cell, pos
      merge!(pos => cell.object_id)
    end

    def instance id
      ObjectSpace._id2ref(id.to_i)
    end

  end
end

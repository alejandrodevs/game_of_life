module GameOfLife
  class Neighbors < Hash

    POSITIONS = [:n, :nw, :w, :sw, :s, :se, :e, :ne]

    def [] pos
      instance(fetch(pos){}.to_i)
    end

    def instances
      values.map{ |c| instance(c) }
    end

    def alive
      instances.map(&:status).reduce(&:+)
    end

    def add cell, pos
      merge!(pos => cell.__id__)
    end

    def instance id
      ObjectSpace._id2ref(id)
    end

  end
end

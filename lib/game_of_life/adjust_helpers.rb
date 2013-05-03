module GameOfLife
  module AdjustHelpers

    def inverse_positions
      {
        :n  => :s,
        :s  => :n,
        :e  => :w,
        :w  => :e,
        :ne => :sw,
        :sw => :ne,
        :nw => :se,
        :se => :nw
      }
    end

    def sides_positions
      {
        :n  => [:ne, :nw],
        :s  => [:sw, :se],
        :e  => [:se, :ne],
        :w  => [:nw, :sw],
        :nw => [:n, :w],
        :ne => [:e, :n],
        :sw => [:w, :s],
        :se => [:s, :e],
      }
    end

  end
end

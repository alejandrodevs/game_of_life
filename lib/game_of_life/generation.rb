module GameOfLife
  class Generation < Array

    def evolve
      Evolution.new(self).new_generation
    end

  end
end

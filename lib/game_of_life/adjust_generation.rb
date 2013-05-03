module GameOfLife
  class AdjustGeneration
    include AdjustHelpers

    attr_accessor :generation

    def initialize generation
      @generation = generation
    end

    def adjust
      generation.each do |cell|
        adjust_neighborhood(cell) if cell.alive?
      end
    end

    def adjust_neighborhood cell
      cell.neighbors_positions.each do |pos|
        if cell.send(pos).nil?
          #====================================================
          # Prepare cells variables
          #====================================================
          cell_one = cell
          cell_two = Cell.new
          pos_one  = pos
          pos_two  = inverse_positions[pos]

          #====================================================
          # Link cells
          #====================================================
          cell_one.add_neighbor(cell_two, pos_one)
          cell_two.add_neighbor(cell_one, pos_two)

          #====================================================
          # Prepare to link new neighbor
          #====================================================
          cell_one_side_one = sides_positions[pos_one].first
          cell_one_side_two = sides_positions[pos_one].last
          cell_two_side_one = sides_positions[pos_two].first
          cell_two_side_two = sides_positions[pos_two].last

          #====================================================
          # Link new neighbor
          #====================================================
          cell_side_one = cell_one.neighbor_in(cell_one_side_one)
          unless cell_one.send(cell_one_side_one).nil?
            cell_two.add_neighbor(cell_side_one, cell_two_side_two)
            cell_side_one.add_neighbor(cell_two, cell_one_side_two)
          end

          cell_side_two = cell_one.neighbor_in(cell_one_side_two)
          unless cell_one.send(cell_one_side_two).nil?
            cell_two.add_neighbor(cell_side_two, cell_two_side_one)
            cell_side_two.add_neighbor(cell_two, cell_one_side_one)
          end

        end
      end
    end

  end
end

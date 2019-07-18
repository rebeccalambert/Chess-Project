require_relative "piece"
require "colorize"
require "byebug"


class Pawn < Piece

  def initialize(color, board, pos)
    @symbol = " P ".colorize(color) 
    super(color, board, pos)
  end

  def moves(start_pos)
    start_row, start_col = start_pos
    moves = []
    if self.color == :white
      if start_row == 1
        moves << [start_row + 2, start_col]
      end
      moves << [start_row + 1, start_col]

      if @board.grid[start_row + 1][start_col].symbol != "   "
        moves = []
      end
      if @board.grid[start_row +1][start_col+1].color != self.color
        if @board.grid[start_row +1][start_col+1].symbol != "   "
          moves << [start_row +1, start_col+1]
        end
      end
      if @board.grid[start_row +1][start_col-1].color != self.color
        if @board.grid[start_row +1][start_col-1].symbol != "   "
          moves << [start_row +1, start_col-1]
        end
      end

    else
       if start_row == 6
        moves << [start_row - 2, start_col]
      end
      moves << [start_row - 1, start_col]

      if @board.grid[start_row - 1][start_col].symbol != "   "
        moves = []
      end
      if @board.grid[start_row -1][start_col+1].color != self.color
        if @board.grid[start_row-1][start_col+1].symbol != "   "
          moves << [start_row-1, start_col+1]
        end
      end
      if @board.grid[start_row-1][start_col-1].color != self.color
        if @board.grid[start_row-1][start_col-1].symbol != "   "
          moves << [start_row-1, start_col-1]
        end
      end
    end
    return moves
  end
end


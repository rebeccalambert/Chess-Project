
class Piece
  attr_reader :color, :symbol
  attr_accessor :pos

  def initialize(color, board, pos)
    @color = color
     @board = board
    @pos = pos
  end

  def valid_moves
    start_pos = @pos
    moves = self.moves(start_pos)
    valid_moves = []
    moves.each do |arr|
      if arr.length == 2
        valid_moves << arr if valid(arr, self.color)
      else
        arr.each do |pos|
          if valid(pos, self.color) == false
            break
          elsif @board.grid[pos[0]][pos[1]].symbol != "   "
            valid_moves << pos
            break
          else
             valid_moves << pos
          end
        end
      end
      
    end
    valid_moves
  end

  def valid(pos, color)
    start_row, start_col = pos
    return false if pos[0] < 0 || pos[1] < 0
    return false if pos[0] > 7 || pos[1] > 7
    
    return false if @board.grid[start_row][start_col].color == color
    true
  end


end


class NullPieceError < StandardError; end
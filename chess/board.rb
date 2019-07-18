require_relative "piece"
require_relative "castle"
require_relative "knight"
require_relative "bishop"
require_relative "pawn"
require_relative "king"
require_relative "queen"
require_relative "nullpiece"
require_relative "cursor"
require "colorize"

require "byebug"
class Board
  attr_reader :grid, :cursor
  def initialize
    # @cursor = Cursor.new([0,0], self)
    populate_board
  end

  def populate_board
    @grid = Array.new(8) {Array.new(8, NullPiece.instance)}

    @grid[0].each_with_index do |piece, i|
      if i == 0 || i == 7
        @grid[0][i] = Castle.new(:white, self, [0,i])
      end

      if i == 1 || i == 6
        @grid[0][i] = Knight.new(:white, self, [0,i])
      end

      if i == 2 || i == 5
        @grid[0][i] = Bishop.new(:white, self, [0,i])
      end

      if i == 3
        @grid[0][i] = Queen.new(:white, self, [0,i])
      end

      if i == 4
        @grid[0][i] = King.new(:white, self, [0,i])
      end
    end

    @grid[7].each_with_index do |piece, i|
      if i == 0 || i == 7
        @grid[7][i] = Castle.new(:black, self, [7,i])
      end

      if i == 1 || i == 6
        @grid[7][i] = Knight.new(:black, self, [7,i])
      end

      if i == 2 || i == 5
        @grid[7][i] = Bishop.new(:black, self, [7,i])
      end

      if i == 3
        @grid[7][i] = Queen.new(:black, self, [7,i])
      end

      if i == 4
        @grid[7][i] = King.new(:black, self, [7,i])
      end
    end
      
    
    @grid[1].each_with_index do |piece, i|
      @grid[1][i] = Pawn.new(:white, self, [1,i])
    end
    
    @grid[6].each_with_index do |piece, i|
      @grid[6][i] = Pawn.new(:black, self, [6,i])
    end

  end

  def show_board
    @grid.each_with_index do |row , i|
      row.each_with_index do |piece, j|
        # if [i, j] == @cursor.cursor_pos
        #   print piece.symbol.colorize(:background => :green)
        if (i.odd? && j.odd?) || (i.even? && j.even?)
        print piece.symbol.colorize(:background => :red)
        else
          print piece.symbol.colorize(:background => :blue)
        end
      end
      puts ""
    end
  end
    


  def move_piece(color, start_pos, end_pos)
    start_row, start_col = start_pos
    end_row, end_col = end_pos

    moves = @grid[start_row][start_col].valid_moves
    
    if @grid[start_row][start_col].color != color
      raise "No piece at position"
    end

    if !moves.include?(end_pos)
      raise "Cannot move to end position"
    end
       
    if @grid[end_row][end_col].symbol == "   "
      @grid[start_row][start_col].pos = [end_row, end_col]
      @grid[end_row][end_col], @grid[start_row][start_col] = @grid[start_row][start_col], @grid[end_row][end_col]
    else
      @grid[start_row][start_col].pos = [end_row, end_col]
      @grid[end_row][end_col] = @grid[start_row][start_col]
      @grid[start_row][start_col] = NullPiece.instance
    end

  end


end

board = Board.new
board.show_board
board.move_piece(:white, [1,3], [3,3])
# board.cursor.get_input
 puts "_________________"
board.show_board

#  board.move_piece(:white, [1,3], [3, 3])

 

  # board.move_piece(:white, [0,2], [5,7])
  # board.show_board
  # puts 
  # puts
  # board.move_piece(:white, [5, 7], [6, 6])
  # board.show_board

# board.grid
#  board.grid.each do |row|
#   puts row
#  end
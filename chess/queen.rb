require_relative "piece"
require_relative "slideable"
require "colorize"

require "byebug"

class Queen < Piece
  include Slideable

  def initialize(color, board, pos)
    @symbol = " Q ".colorize(color)
    super(color, board, pos)
  end

  def move_dirs
    [[1,1], [-1,-1], [1,-1], [-1,1], [0,1], [0,-1], [1,0], [-1,0]]
  end 

end

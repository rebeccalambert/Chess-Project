require_relative "piece"
require_relative "slideable"
require "colorize"

class Bishop < Piece
  include Slideable

  def initialize(color, board, pos)
    @symbol = " B ".colorize(color)
    super(color, board, pos)
  end



  def move_dirs
    [[1,1], [-1,-1], [1,-1], [-1,1]]
  end 

end


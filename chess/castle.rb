require_relative "piece"
require_relative "slideable"
require "colorize"

class Castle < Piece
  include Slideable

 def initialize(color, board, pos)
   @symbol = " C ".colorize(color)
   super(color, board, pos)
 end

  def move_dirs
    [[0,1], [0,-1], [1,0], [-1,0]]
  end 

end

#castle = Castle.new(:white, [0,0])
#p castle.moves([0,0])

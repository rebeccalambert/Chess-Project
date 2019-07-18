require_relative "piece"
require_relative "stepable"
require "colorize"

class Knight < Piece
  include Stepable

  def initialize(color, board, pos)
    @symbol = " K ".colorize(color)
    super(color, board, pos)
  end

  def move_difs
    [[1,2], [2, 1], [-2, 1], [-2, -1], [1, -1], [-1, 2], [-1,-2], [2, -1]]
  end

end

require_relative "piece"
require_relative "stepable"
require "colorize"
require "byebug"


class King < Piece
  include Stepable

  def initialize(color, board, pos)
    @symbol = " * ".colorize(color)
    super(color, board, pos)
  end

  def move_difs
    [[1, 0], [1, 1], [0, 1], [-1, 1], [-1, 0], [-1, -1], [0, -1], [1, -1]]
  end

end
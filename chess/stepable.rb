module Stepable

  def moves(start_pos)
    
    start_row, start_col = start_pos
    new_moves = []
    move_difs.each do |pos|
      dy, dx = pos

      new_row = start_row + dy
      new_col = start_col + dx
      new_moves << [new_row, new_col]
  end
  new_moves
end
  
  
  
  # def move_difs
  #   [[]]
  # end

end
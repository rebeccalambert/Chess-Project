module Slideable

  def moves(start_pos)
    possible_moves = []
    move_dirs.each do |dir|
      new_row, new_col = start_pos
      array = []
    7.times do 
      new_row += dir[0]
      new_col += dir[1]
      array << [new_row,new_col]
    end
      possible_moves << array
    end 
    possible_moves
  end

  def move_dirs
    [[1,0]]
  end 
  

end 
# University of Washington, Programming Languages, Homework 6, hw6runner.rb

# This is the only file you turn in, so do not modify the other files as
# part of your solution.

class MyPiece < Piece

  All_My_Pieces = Piece::All_Pieces +
                  [rotations([[0, 0], [1, 0], [-1, 0], [-1, -1], [0, -1]]),
		   [[[-2, 0], [-1, 0], [0, 0], [1, 0], [2, 0]],
		    [[0, -2], [0, -1], [0, 0], [0, 1], [0, 2]]],
		    rotations([[0, 0], [0, -1], [1, 0]])]

  def self.next_piece (board)
    MyPiece.new(All_My_Pieces.sample, board)
  end

  def self.cheat_piece (board)
    MyPiece.new([[[0, 0]]], board)
  end
  
end

class MyBoard < Board
  
  # override to call MyPiece.next_piece
  def initialize (game)
    super(game)
    @current_block = MyPiece.next_piece(self)
    @cheating = false
  end
  
  # override to call MyPiece.next_piece and support cheating
  def next_piece
    if @cheating
      @current_block = MyPiece.cheat_piece(self)
      @cheating = false
    else
      @current_block = MyPiece.next_piece(self)
    end
    @current_pos = nil
  end
  
  # override to handle number of tiles != 4
  def store_current
    locations = @current_block.current_rotation
    displacement = @current_block.position
    (0..(locations.size-1)).each{|index| 
      current = locations[index];
      @grid[current[1]+displacement[1]][current[0]+displacement[0]] = 
      @current_pos[index]
    }
    remove_filled
    @delay = [@delay - 2, 80].max
  end
  
  # new method to implement 180 degree rotation
  def rotate_180_degrees
    if !game_over? and @game.is_running?
      @current_block.move(0, 0, 2)
    end
    draw
  end
  
  # new method to attempt cheating
  def cheat
    if !@cheating and @score >= 100
      @cheating = true
      @score -= 100 
      @game.update_score
    end
  end
  
end

class MyTetris < Tetris
  
  # override to create @board of MyBoard
  def set_board
    @canvas = TetrisCanvas.new
    @board = MyBoard.new(self)
    @canvas.place(@board.block_size * @board.num_rows + 3,
                  @board.block_size * @board.num_columns + 6, 24, 80)
    @board.draw
  end
  
  # override to add additional key binding
  def key_bindings  
    super
    @root.bind('u', proc {@board.rotate_180_degrees})
    @root.bind('c', proc {@board.cheat})
  end

end



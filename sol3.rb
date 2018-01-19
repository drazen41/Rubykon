# University of Washington, Programming Languages, Homework 6, hw6runner.rb

# This is the only file you turn in, so do not modify the other files as
# part of your solution.

class MyPiece < Piece
  # The constant All_My_Pieces should be declared here
  All_My_Pieces = All_Pieces +
      [rotations([[0, 0], [1, 0], [1, -1], [0, -1], [-1, -1]]), # 5-block
               [[[0, 0], [-1, 0], [1, 0], [-2, 0], [2, 0]], # 5-block long
               [[0, 0], [0, -1], [0, 1], [0, -2], [0, 2]]],
               rotations([[0, 0], [1, 0], [0, 1]])] # 3-block
  # your enhancements here
  def self.next_piece (board)
    MyPiece.new(All_My_Pieces.sample, board)
  end
  
  def self.cheat_piece (board)
    MyPiece.new([[[0, 0]]], board)
  end
  
  # class method to figures out the different rotations of the provided piece
  def self.rotations (point_array)
    rotate1 = point_array.map {|x,y| [-y,x]}  
    rotate2 = point_array.map {|x,y| [-x,-y]} 
    rotate3 = point_array.map {|x,y| [y,-x]}  
    [point_array, rotate1, rotate2, rotate3]  
  end

end

class MyBoard < Board
  # your enhancements here
  
  # Modified to replace Piece with MyPiece
  def initialize (game)
    @grid = Array.new(num_rows) {Array.new(num_columns)}
    @current_block = MyPiece.next_piece(self)
    @score = 0
    @game = game
    @delay = 500
  end
  
  def rotate_180
    if !game_over? and @game.is_running?
      @current_block.move(0, 0, 2)
    end
    draw
  end
  
  # Generate the 1-block piece if the user is cheating
  def next_piece
    if @is_cheating
      @current_block = MyPiece.cheat_piece(self)
      @is_cheating = false
    else
      @current_block = MyPiece.next_piece(self)
    end
    @current_pos = nil
  end
  
  # Perform cheating
  def cheat
    if !@is_cheating and @score >= 100
      @score -= 100
      @is_cheating = true
    end
  end
  
  # gets the information from the current piece about where it is and uses this
  # to store the piece on the board itself.  Then calls remove_filled.
  # Modified to account for pieces with 1, 3, or 5 blocks
  def store_current
    locations = @current_block.current_rotation
    displacement = @current_block.position
    (0..locations.length-1).each{|index| 
      current = locations[index];
      @grid[current[1]+displacement[1]][current[0]+displacement[0]] = 
      @current_pos[index]
    }
    remove_filled
    @delay = [@delay - 2, 80].max
  end
end

class MyTetris < Tetris
  # your enhancements here
  # creates a canvas and the board that interacts with it
  # Modified to replace Board with MyBoard
  def set_board
    @canvas = TetrisCanvas.new
    @board = MyBoard.new(self)
    @canvas.place(@board.block_size * @board.num_rows + 3,
                  @board.block_size * @board.num_columns + 6, 24, 80)
    @board.draw
  end
  
  # Modified to add key bindings for U-turn and cheating
  def key_bindings
    super
    @root.bind('u', proc {@board.rotate_180})
    @root.bind('c', proc {@board.cheat})
  end
end

# University of Washington, Programming Languages, Homework 6, hw6runner.rb

# This is the only file you turn in, so do not modify the other files as
# part of your solution.

class MyPiece < Piece
  # The constant All_My_Pieces should be declared here
  # class array holding all the pieces and their rotations
  
  All_My_Pieces = [[[[0, 0], [1, 0], [0, 1], [1, 1]]],  # square (only needs one)
                 # rotations([[0, 0], [1, 0], [0, 1],[0,0]]), # short T/L
                  #rotations([[0, 0], [-1, 0], [1, 0], [0, -1]]), # T
                # [[[0, 0], [-1, 0], [1, 0], [2, 0]], # long (only needs two)
                 [[0, 0], [0, -1], [0, 1], [0, 2]]],
                  [[[0, 0], [-1, 0], [1, 0], [2, 0]]] # long long (only needs two)
                 #[[0, 0], [0, -1], [0, 1], [0, 2]]], 
                 #rotations([[0, 0], [0, -1], [0, 1], [1, 1]]), # fat L  
                 #rotations([[0, 0], [0, -1], [0, 1], [1, 1]]), # L
                 #rotations([[0, 0], [0, -1], [0, 1], [-1, 1]]), # inverted L
                 #rotations([[0, 0], [-1, 0], [0, -1], [1, -1]]), # S
                 #rotations([[0, 0], [1, 0], [0, -1], [-1, -1]])] # Z
                   
  # your enhancements here
  def initialize(point_array, board) 
    @all_rotations = point_array
        @rotation_index = (0..(@all_rotations.size-1)).to_a.sample
        @color = All_Colors.sample
        @base_position = [5, 0] # [column, row]
        @board = board
        @moved = true
  end
  def self.next_piece (board)
      MyPiece.new(All_My_Pieces.sample, board)
  end
end

class MyBoard < Board
  # your enhancements here
  def initialize(game)
   
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
  def next_piece
    @current_block = MyPiece.next_piece(self)
    @current_pos = nil
  end
end

class MyTetris < Tetris
  # your enhancements here
 def initialize
   super 
 end
  def set_board
        @canvas = TetrisCanvas.new
        @board = MyBoard.new(self)
        @canvas.place(@board.block_size * @board.num_rows + 3,
                      @board.block_size * @board.num_columns + 6, 24, 80)
        @board.draw
  end
  def key_bindings
    @root.bind('u', proc {@board.rotate_180})
    super
  end
end



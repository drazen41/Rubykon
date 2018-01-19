# University of Washington, Programming Languages, Homework 6, hw6runner.rb

# This is the only file you turn in, so do not modify the other files as
# part of your solution.

class MyPiece < Piece
  # The constant All_My_Pieces should be declared here
  # class array holding all the pieces and their rotations
  
  All_My_Pieces = [[[[0, 0], [1, 0], [0, 1], [1, 1]]],  # square (only needs one)
                  rotations([[0, 0], [-1, 0], [1, 0], [0, -1]]), # T
                  [[[0, 0], [-1, 0], [1, 0], [2, 0]], # long (only needs two)
                  [[0, 0], [0, -1], [0, 1], [0, 2]]],
                  rotations([[0, 0], [0, -1], [0, 1], [0, 2]]), # short T/L - new
                  rotations([[0, 0], [1, 0], [0, 1]]), # small L
                  [[[-2,0], [-1,0], [0,0], [1,0], [2,0]],[[0,-2], [0,-1], [0,0], [0,1], [0,2]]], #extra long - new
                  rotations([[0, 0], [1, 0], [0, 1], [0, 2],[1,1]]), # fat L - new  
                  rotations([[0, 0], [0, -1], [0, 1], [1, 1]]), # L
                  rotations([[0, 0], [0, -1], [0, 1], [-1, 1]]), # inverted L
                  rotations([[0, 0], [-1, 0], [0, -1], [1, -1]]), # S
                  rotations([[0, 0], [1, 0], [0, -1], [-1, -1]])] # Z
                   
  # your enhancements here
  def initialize(point_array, board) 
   super
  end
  def self.next_piece (board)
      MyPiece.new(All_My_Pieces.sample, board)
      
  end
end

class MyBoard < Board
  # your enhancements here
  attr_accessor :cheater
  
  def initialize(game)
   
    @grid = Array.new(num_rows) {Array.new(num_columns)}
        @current_block = MyPiece.next_piece(self)
        @score = 0
        @game = game
        @delay = 500
       @cheater = false
  end
  
  def rotate_180
      if !game_over? and @game.is_running?
        @current_block.move(0, 0, 2)
      end
      draw
  end
  def next_piece
    if @cheater
      @score -=100
      @current_block = MyPiece.new([[[0,0]]], self)
      @game.update_score
      @cheater = false
    else
      @current_block = MyPiece.next_piece(self)
    end    
    @current_pos = nil
  end
def store_current
    locations = @current_block.current_rotation
    displacement = @current_block.position
    (0..locations.size-1).each{|index| 
      current = locations[index];
      @grid[current[1]+displacement[1]][current[0]+displacement[0]] = 
      @current_pos[index]
    }
    remove_filled
    @delay = [@delay - 2, 80].max
  end
  def cheat
    if @score >= 100      
      @cheater = true
    end
    
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
      @root.bind('c',proc {@board.cheat})
    super
  end
end



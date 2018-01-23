require_relative "hw7.rb"



#Constants for testing
ZERO = 0.0
ONE = 1.0
TWO = 2.0
THREE = 3.0
FOUR = 4.0
FIVE = 5.0
SIX = 6.0
SEVEN = 7.0
TEN = 10.0

#Let Tests
l = Let.new("a", LineSegment.new(-ONE,-TWO,THREE,FOUR),
             Intersect.new(Var.new("a"),LineSegment.new(THREE,FOUR,-ONE,-TWO)))
l1 = l.preprocess_prog.eval_prog([])
if not (l1.x1 == -ONE and l1.y1 == -TWO and l1.x2 == THREE and l1.y2 == FOUR)
  puts "Let eval_prog should evaluate e2 after adding [s, e1] to the environment"
end
#1
k = Let.new("x",Let.new("x",NoPoints.new,Point.new(0.0,0.0)),Var.new("x"))
k1 = k.preprocess_prog.eval_prog([])
if not ((k1.is_a? Point) and k1.x==0.0 and k1.y==0.0)
  puts "Let eval_prog wrong answer 1"
end
#2
k= Let.new("x",NoPoints.new,Let.new("x",Point.new(0.0,0.0),Var.new("x")))
k1 = k.preprocess_prog.eval_prog([])
if not ((k1.is_a? Point) and k1.x==0.0 and k1.y==0.0)
  puts "Let eval_prog wrong answer 2"
end
  
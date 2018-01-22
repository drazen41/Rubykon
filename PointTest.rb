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

#Point Tests
a = Point.new(THREE,FIVE)
if not (a.x == THREE and a.y == FIVE)
  puts "Point is not initialized properly"
end
if not (a.eval_prog([]) == a)
  puts "Point eval_prog should return self"
end
if not (a.preprocess_prog == a)
  puts "Point preprocess_prog should return self"
end
a1 = a.shift(THREE,FIVE)
if not (a1.x == SIX and a1.y == TEN)
  puts "Point shift not working properly"
end
a2 = a.intersect(Point.new(THREE,FIVE))
if not (a2.x == THREE and a2.y == FIVE)
  puts "Point intersect not working properly"
end 
a3 = a.intersect(Point.new(FOUR,FIVE))
if not (a3.is_a? NoPoints)
  puts "Point intersect not working properly"
end
b = Point.new(ONE,FOUR)
b1 = b.intersect(Line.new(1.0,3.0)) #y, m * x + b
if not(b1.x == ONE and b1.y==FOUR)
  puts "Point intersect with Line not working properly" 
end
  
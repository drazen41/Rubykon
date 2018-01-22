require_relative "hw7.rb"

s = Shift.new(2.0,3.2,LineSegment.new(1.0,2.0,1.0,2.0))
s1 = s.preprocess_prog
if not ((s1.e.is_a? Point) and s1.dx == 2.0 and s1.dy == 3.2 )
  puts "Shift should shift e by dx and dy"
end

s = Shift.new(2.0,3.2,LineSegment.new(2.0,3.0,1.0,0.0))
s1 = s.preprocess_prog
if not ((s1.e.is_a? LineSegment) and s1.dx == 2.0 and s1.dy == 3.2 and s1.e.x1== 1.0 and s1.e.y1==0.0 and s1.e.x2==2.0 and s1.e.y2==3.0)
  puts "Shift should shift e by dx and dy"
end
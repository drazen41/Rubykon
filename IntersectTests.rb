require_relative "hw7_rev3.rb"

#1
i = Intersect.new(Point.new(1.0,1.0), LineSegment.new(1.0,1.0,5.0,6.0))
i1 = i.preprocess_prog.eval_prog([])
if not ((i1.is_a? Point) and i1.x == 1.0 and i1.y == 1.0 )
  puts "Incorrect answer 1"
end
#2
i = Intersect.new(LineSegment.new(1.0,1.0,5.0,6.0), Point.new(1.0,1.0))
i1 = i.preprocess_prog.eval_prog([])
if not ((i1.is_a? Point) and i1.x == 1.0 and i1.y == 1.0 )
  puts "Incorrect answer 2"
end
#3
i = Intersect.new(Line.new(5.0,2.0), Line.new(7.0,-1.0))
i1 = i.preprocess_prog.eval_prog([])
if not ((i1.is_a? Point) and i1.x == 1.5 and i1.y == 9.5 )
  puts "Incorrect answer 3"
end
#4
i = Intersect.new(Line.new(1.0,0.0), LineSegment.new(3.0,6.0,9.0,11.0))
i1 = i.preprocess_prog.eval_prog([])
if not ((i1.is_a? NoPoints))
  puts "Incorrect answer 4"
end
#5
i = Intersect.new(LineSegment.new(1.0,5.0,2.0,2.0), Line.new(5.0,0.0))
i1 = i.preprocess_prog.eval_prog([])
if not ((i1.is_a? Point) and i1.x==1.0 and i1.y==5.0)
  puts "Incorrect answer 5"
end
#6
i = Intersect.new(VerticalLine.new(2.0), LineSegment.new(-1.0,-1.0,3.0,3.0))
i1 = i.preprocess_prog.eval_prog([])
if not ((i1.is_a? Point) and i1.x==2.0 and i1.y==2.0)
  puts "Incorrect answer 6"
end
#7
i = Intersect.new(LineSegment.new(-1.0,-1.0,3.0,3.0), VerticalLine.new(2.0))
i1 = i.preprocess_prog.eval_prog([])
if not ((i1.is_a? Point) and i1.x==2.0 and i1.y==2.0)
  puts "Incorrect answer 7"
end
#8
i = Intersect.new(LineSegment.new(5.0,7.0,9.0,9.0), LineSegment.new(5.0,7.0,6.0,-1.0))
i1 = i.preprocess_prog.eval_prog([])
if not ((i1.is_a? Point) and i1.x==5.0 and i1.y==7.0)
  puts "Incorrect answer 8"
end
#9
i = Intersect.new(LineSegment.new(2.0,3.0,4.0,9.0), LineSegment.new(0.0,-3.0,6.0,15.0))
i1 = i.preprocess_prog.eval_prog([])
if not ((i1.is_a? LineSegment) and i1.x1==2.0 and i1.y1==3.0 and i1.x2==4.0 and i1.y2==9.0)
  puts "Incorrect answer 9"
end
#10
i = Intersect.new(LineSegment.new(-1.0,-1.0,3.0,3.0), VerticalLine.new(-5.0))
i1 = i.preprocess_prog.eval_prog([])
if not (i1.is_a? NoPoints )
  puts "Incorrect answer 10"
end
#11
i = Intersect.new(LineSegment.new(2.0,3.0,6.0,15.0), LineSegment.new(0.0,-3.0,4.0,9.0))
i1 = i.preprocess_prog.eval_prog([])
if not ((i1.is_a? LineSegment) and i1.x1==2.0 and i1.y1==3.0 and i1.x2==4.0 and i1.y2==9.0)
  puts "Incorrect answer 11"
end
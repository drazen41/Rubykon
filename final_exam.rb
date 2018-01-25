def foo x
if x
yield
else
yield
yield
end
end
foo (true) { puts "hi" }
foo (false) { puts "hi" }
# Programming Languages, Dan Grossman
# Section 7: Procs

a = [3,5,7,9]

# no need for Procs here
b = a.map {|x| x + 1}

i = b.count {|x| x >= 6}

# need Procs here: want an array of functions
c = a.map {|x| lambda {|y| x >= y} }

# elements of c are Proc objects with a call method

c[2].call 17 # ==> false (6 >= 17)
c[2].call 6 # => true
j = c.count {|x| x.call(5) } # 3 (3>=5, 5>=5, 7>=5, 9>=5)

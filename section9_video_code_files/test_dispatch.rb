require_relative './145_double_dispatch'

x = Add.new(MyString.new("hello"),Int.new(4))
puts x.toString
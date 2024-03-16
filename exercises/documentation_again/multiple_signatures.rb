a = %w(a b c d e)
puts a.fetch(7)                       # => error because it's outside of array bounds.
puts a.fetch(7, 'beats me')           # => 'beats me' , no error because there's a second argument 
puts a.fetch(7) { |index| index**2 }  # => 49
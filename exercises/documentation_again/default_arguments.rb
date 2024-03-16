def my_method(a, b = 2, c = 3, d)
  p [a, b, c, d]
end

my_method(4, 5, 6) # => [4, 5, 3, 6]

# Fills in from left to right.
# In this case 4 is assigned to a and 6 is assigned to d. 5 will be assinged to b.
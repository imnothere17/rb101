def factors(number)
  divisor = number
  factors = []
  while divisor > 0 # Stops when divisor is 0 or a negative number. Also, makes it avoid error.
    factors << number / divisor if number % divisor == 0 # number % divisor == 0 to make sure the result does not have a remainder.
    divisor -= 1
  end
  factors # it returns the value of factors
end

p factors(-1)
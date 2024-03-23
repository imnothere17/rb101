def triangle(num)
  space = num
  stars = 0
  
  num.times do
    space -= 1
    stars += 1
    
    puts "#{' ' * space}#{'*' * stars}"
  end  
end

triangle(5)
triangle(9)
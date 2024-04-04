def prompt(string)
  puts "=> #{string}"
end

prompt("Enter the length of the room in meters:")
length = gets.chomp.to_f

prompt("Enter the width of the room in meters:")
width = gets.chomp.to_f

area = (length * width).round(2)

feet = (area * 10.7639).round(2)

prompt("The area of the room is #{area} square meters (#{feet} square feet)")

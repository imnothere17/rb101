def print_in_box(string)
  width = "+#{'-' * (string.length + 2)}+"
  empty_space = "|#{' ' * (string.length + 2)}|"
  
  if string.length <= 75
    puts width, empty_space
    puts "| #{string} |"
    puts empty_space, width
  else
    strings_array = []
    while string.length > 75
      strings_array << string.slice!(0..75)
    end
    strings_array << string.concat(empty_space[1..76 - string.length])
    puts "#{width[0..78]}+"
    puts "#{empty_space[0..78]}|"
    for value in strings_array do
      puts "| #{value} |"
    end
    puts "#{empty_space[0..78]}|"
    puts "#{width[0..78]}+"
  end
end

print_in_box('To boldly go where no one has gone before.')
print_in_box('To boldly go where no one has gone before. To boldly go where no one has gone before. To boldly go where no one has gone before. To boldly go where no one has gone before.')
print_in_box('')
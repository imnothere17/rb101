def prompt(string)
  puts "=> #{string}"
end

prompt("What is your name?")
name = gets.chomp

if name[-1] == '!'
  name.chop!
  prompt("HELLO #{name.upcase}. WHY ARE WE SCREAMING?")
else
  prompt("Hello #{name}.")
end
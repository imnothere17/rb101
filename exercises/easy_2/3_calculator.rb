def prompt(string)
  puts "=> #{string}"
end

prompt("What is the bill?")
bill = gets.chomp.to_f

prompt("What is the tip percentage?")
percentage = gets.chomp.to_f / 100

tip = (bill * percentage).round(2)

total = (bill + tip).round(2)

prompt("The tip is $#{tip}")
prompt("The total is $#{total}")
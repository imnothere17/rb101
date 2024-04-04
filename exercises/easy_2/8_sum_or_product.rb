def prompt(string)
  puts "=> #{string}"
end

def sum(num)
  total = 0
  1.upto(num) {|x| total += x }
  total
end

def product(num)
  total = 1
  1.upto(num) {|x| total *= x }
  total
end

def valid_num?(num)
  num.to_i.to_s == num
end

num = nil
loop do
  prompt("Please enter an integer greater than 0:")
  num = gets.chomp
  
  break if valid_num?(num)
end

loop do
  prompt("Enter 's' to compute the sum, 'p' to compute the product.")
  operator_choice = gets.chomp
  
  if operator_choice == 's'
    prompt(sum(num.to_i))
    break
  elsif operator_choice == 'p'
    prompt(product(num.to_i))
    break
  else
    prompt("Invalid choice. Enter agian.")
  end
end

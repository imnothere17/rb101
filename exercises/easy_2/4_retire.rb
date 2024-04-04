require 'time'

def prompt(string)
  puts "=> #{string}"
end



prompt("What is your age?")
age = gets.chomp.to_i

prompt("At what age would you like to retire?")
retire_age = gets.chomp.to_i

year = Time.now.year

retire_length = retire_age - age 

retire_year = year + retire_length

prompt("It's #{year}. You will retire in #{retire_year}.")
prompt("You have only #{retire_length} years of work to go!")
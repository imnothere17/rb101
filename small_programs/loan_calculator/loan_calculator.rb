require "yaml"
MESSAGES = YAML.load_file('loan_messages.yml')

def prompt(message)
  Kernel.puts "=> #{message}"
end

def number?(input)
  input.to_i.to_s == input
end

puts "Welcome to the Loan Calculator"

name = ''
loop do
  puts "Enter Name:"
  name = Kernel.gets().chomp()
  if name.empty?()
    prompt(MESSAGES['valid_name'])
  else
    break
  end
end

prompt("Hi, #{name}!")

loop do
  loan = nil
  loop do
    prompt("Enter the loan amount:")
    loan = Kernel.gets().chomp()
    break if number?(loan)
    prompt(MESSAGES['valid_number'])
  end
  annual_rate = nil
  loop do
    prompt("Enter the Annual Percentage Rate(APR):")
    annual_rate = Kernel.gets().chomp()
    break if number?(annual_rate)
    prompt(MESSAGES['valid_number'])
  end
  duration = nil
  loop do
    prompt("Enter the loan duration (in years):")
    duration = Kernel.gets().chomp()
    break if number?(duration)
    prompt(MESSAGES['valid_number'])
  end
  annual_percentage = annual_rate.to_f() / 100
  monthly_rate = annual_percentage / 12
  months = duration.to_i() * 12
  monthly_payment = loan.to_f() *
                    (monthly_rate /
                    (1 - (1 + monthly_rate)**(-months)))
  prompt("Your monthly payment is #{monthly_payment.round(2)}")
  prompt("Do you want to perform another calculatrion (Y to calculate again).")
  answer = gets().chomp().downcase()
  break unless answer.include?('y')
end

require 'yaml'
MESSAGES = YAML.load_file('calculator_messages.yml')

def prompt(message)
  Kernel.puts("=> #{message}")
end

def integer?(input)
  input.to_i().to_s() == input
end

def float?(input)
  input.to_f().to_s() == input
end

def number(input)
  integer?(input) || float?(input)
end


def operation_to_message(op)
  prompt = case op
           when '1'
              'adding'
           when '2'
              'subtracting'
           when '3'
              'multiplying'
           when '4'
              'dividing'
           end
           
  prompt
end

prompt(MESSAGES['welcome'])

name = ''
loop do
  name = Kernel.gets().chomp()
  if name.empty?()
    prompt(MESSAGES['valid_name'])
  else
    break
  end
end

prompt("Hi #{name}!")

loop do
  num1 = nil
  loop do
    prompt("Enter first num:")
    num1 = Kernel.gets().chomp()
    if number(num1)
      break
    else
      prompt("Invalid number!")
    end
  end
  num2 = nil
  loop do
    prompt("Enter second num:")
    num2 = Kernel.gets().chomp()
    if number(num2)
      break
    else
      prompt("Invalid number!")
    end
  end
  operator_prompt = <<-MSG
    What operation would you like to perform?
    1) add
    2) subtract
    3) multiply
    4) divide
  MSG
  prompt(operator_prompt)
  operator = ''
  loop do
    operator = Kernel.gets().chomp()
    if %w(1 2 3 4).include?(operator)
      break
    else
      prompt("Must choose 1, 2, 3, or 4")
    end
  end
  prompt("#{operation_to_message(operator)} the two numbers...")
  results = case operator
            when '1'
              num1.to_i() + num2.to_i()
            when '2'
              num1.to_i() - num2.to_i()
            when '3'
              num1.to_i() * num2.to_i()
            when '4'
              num1.to_f() / num2.to_f()
            end
  prompt("The result is #{results}")
  prompt("Do you want to perform another calculation? (Y to calculate again)")
  answer = Kernel.gets().chomp()
  break unless answer.downcase().start_with?('y')
end

prompt("Thank you for using the calculator.")

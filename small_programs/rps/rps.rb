require 'yaml'
require 'pry'
MESSAGES = YAML.load_file('rps_messages.yml')

def prompt(message)
  Kernel.puts("=> #{message}")
end

def win?(player, computer)
  rules = { 'r' => ['s', 'l'],
            'p' => ['r', 'sp'],
            's' => ['p', 'l'],
            'sp' => ['s', 'r'],
            'l' => ['p', 'sp'] }
  rules[player].include?(computer)
end

def display_results(player, computer)
  if win?(player, computer)
    prompt("You won!")
  elsif win?(computer, player)
    prompt("Computer won!")
  else
    prompt("It's a tie!")
  end
end

def winner(player, computer)
  if player == 3
    prompt("Congratulations! YOU WON!")
  elsif computer == 3
    prompt("YOU'RE DEAD")
  end
end

valid_choices = { 'r' => 'rock',
                  'p' => 'paper',
                  's' => 'scissors',
                  'sp' => 'spock',
                  'l' => 'lizard' }

prompt(MESSAGES['welcome'])

name = ''
loop do
  prompt("Enter your name:")
  name = Kernel.gets().chomp()
  break unless name.empty?
  prompt(MESSAGES['valid_name'])
end

loop do
  prompt(MESSAGES['tutorial'])
  player_score = 0
  computer_score = 0
  loop do
    choice = ''
    loop do
      prompt(MESSAGES['choices_prompt'])
      choice = Kernel.gets().chomp().downcase()
      break if valid_choices.key?(choice)
      prompt(MESSAGES['valid_choice'])
    end
    computer_choice = valid_choices.keys.sample()
    prompt("You chose: #{valid_choices[choice]}")
    prompt("Computer cose: #{valid_choices[computer_choice]}")
    display_results(choice, computer_choice)
    if win?(choice, computer_choice)
      player_score += 1
    elsif win?(computer_choice, choice)
      computer_score += 1
    end
    prompt("#{player_score} : #{computer_score}")
    winner(player_score, computer_score)
    break if player_score == 3 || computer_score == 3
  end
  prompt("Would you like to play again?(Enter 'y' to play again.)")
  user_input = Kernel.gets().chomp().downcase()
  break unless user_input.include?('y')
end

prompt("Thank you for playing #{name}. Good bye!")

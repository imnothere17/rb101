require 'yaml'
require 'pry'
MESSAGES = YAML.load_file('rps_messages.yml')

GAMES_TO_WIN = 3

VALID_CHOICES = { 'r' => 'rock',
                  'p' => 'paper',
                  's' => 'scissors',
                  'sp' => 'spock',
                  'l' => 'lizard' }

def prompt(message)
  Kernel.puts("=> #{message}")
end

def get_name
  name = ''
  loop do
    prompt("Enter your name:")
    name = Kernel.gets().chomp()
    break unless name.empty?
    prompt(MESSAGES['valid_name'])
  end
  name
end

def player_choice?
  prompt(MESSAGES['choices_prompt'])
  prompt(MESSAGES['help'])
  choice = ''
  loop do
    choice = Kernel.gets().chomp().downcase()
    if VALID_CHOICES.key?(choice)
      break
    elsif choice == 'h'
      prompt(MESSAGES['tutorial'])
    else
      prompt(MESSAGES['valid_choice'])
    end
  end
  prompt("You chose: #{VALID_CHOICES[choice]}")
  choice
end

def win?(winner, loser)
  rules = { 'r' => ['s', 'l'],
            'p' => ['r', 'sp'],
            's' => ['p', 'l'],
            'sp' => ['s', 'r'],
            'l' => ['p', 'sp'] }
  rules[winner].include?(loser)
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

def grand_winner?
  player_score = 0
  computer_score = 0
  until player_score == GAMES_TO_WIN || computer_score == GAMES_TO_WIN
    prompt("#{NAME}: #{player_score} | Computer: #{computer_score}")
    choice = player_choice?
    computer_choice = VALID_CHOICES.keys.sample()
    prompt("Computer cose: #{VALID_CHOICES[computer_choice]}")
    display_results(choice, computer_choice)
    player_score += 1 if win?(choice, computer_choice)
    computer_score += 1 if win?(computer_choice, choice)
    sleep(3)
    system("clear")
  end
  prompt("#{NAME}: #{player_score} | Computer: #{computer_score}")
  winner(player_score, computer_score)
end

def valid_input(input)
  input == 'y' || input == 'n'
end

def play_again?
  user_input = ''
  loop do
    prompt(MESSAGES['play_again'])
    user_input = Kernel.gets().chomp().downcase()
    break if valid_input(user_input)
    prompt(MESSAGES['valid_choice'])
  end
  user_input
end

prompt(MESSAGES['welcome'])

prompt(MESSAGES['tutorial'])

NAME = get_name

loop do
  system("clear")
  grand_winner?
  rematch = play_again?
  system("clear")
  break if rematch.include?('n')
end

prompt("Thank you for playing #{NAME}. Good bye!")

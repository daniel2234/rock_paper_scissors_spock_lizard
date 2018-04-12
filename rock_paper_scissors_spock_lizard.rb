VALID_CHOICES = ['rock', 'scissors', 'paper', 'lizard', 'spock']

def prompt(message)
  puts "=>#{message}"
end

def win?(player, computer)
  (player == 'scissors' && computer == 'paper') ||
  (player == 'paper' && computer == 'rock') ||
  (player == 'rock' && computer == 'lizard') ||
  (player == 'lizard' && computer == 'spock') ||
  (player == 'spock' && computer == 'scissors') ||
  (player == 'scissors' && computer == 'lizard') ||
  (player == 'lizard' && computer == 'paper') ||
  (player == 'paper' && computer == 'spock') ||
  (player == 'spock' && computer == 'rock') ||
  (player == 'rock' && computer == 'scissors')
end

def display_results(player, computer)
  if win?(player, computer)
    'player wins'
  elsif win?(computer, player)
    'computer wins'
  else
    'it is a tie'
  end
end

def format_list(choice)
  case choice
  when 'r' then return 'rock'
  when 'l' then return 'lizard'
  when 'p' then return 'paper'
  when 's' then
    puts 'Did you mean Spock or Scissors?'
    choice = gets.chomp
  end
end

def determine_winner(computer_score, player_score, tie_score, max_score)
  if computer_score == 5
    puts "Computer has won!"
  elsif player_score == 5
    puts "Player has won!"
  elsif tie_score == 5
    puts "Score is tied!"
  end
end

loop do
  max_score = 5
  player_score = 0
  computer_score = 0
  tie_score = 0

  loop do
    choice = ''
    loop do
      prompt ("Choose on (#{VALID_CHOICES.join(', ')})")
      choice = gets.chomp
      choice = format_list(choice)

      if VALID_CHOICES.include?(choice)
        break
      else
        prompt("That's not a valid choice.")
      end
    end

    computer_choice = VALID_CHOICES.sample

    prompt("You chose #{choice} and the Computer chose: #{computer_choice}")

    winning_result = display_results(choice, computer_choice)

    if winning_result == 'player wins'
      player_score += 1
    elsif winning_result == 'computer wins'
      computer_score += 1
    elsif winning_result == 'it is a tie'
      tie_score += 1
    end

    puts "Computer Score: #{computer_score}"
    puts "Player Score: #{player_score}"
    puts "Tie Score: #{tie_score}"

    determine_winner(computer_score, player_score, tie_score, max_score)

    break if computer_score == max_score || player_score == max_score || tie_score == max_score
  end
  prompt("Do you want to play again? (y or n)")
  answer = gets.chomp
  system('clear')
  break unless answer.downcase.start_with?('y')
end

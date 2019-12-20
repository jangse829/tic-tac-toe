# A TIC-TAC-TOE GAME

# Declare all winning result as constants
RESULT_LSIT = 
[[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6],
[1, 4, 7],[2, 5, 8], [0, 4, 8], [2, 4, 6]]

# Display the board
def displayBoard(moves)
  arr = [0, 3, 6]
  for i in arr
    puts " #{moves[i]} | #{moves[i+1]} | #{moves[i+2]} "
    puts i == 6 ? "\n" : "－－－－－"
  end
end

# Main method
def main(moves)
  round = 1
  while round <= 9 && !finish?(moves)
    puts "ROUND #{round}"
    move(moves, round)
    round += 1
  end
  if finish?(moves)
    puts "#{determine_the_winner(moves)} WON!"
  else
    puts "TIE GAME!"
  end
  puts "GAME OVER!"
end

# Determine who's turn it is 
def move(moves,round)
  if judge_player(round) == "X"
    print "ENTER THE NUMBER TO CHOOSE YOUR MOVE: "
    input = gets.chomp
    position = input.to_i - 1
  else
    puts "COMPUTER'S TURN!"
    position = compute_position(moves)
  end
  if checkPosition(moves, position)
    moves[position] = judge_player(round)
    displayBoard(moves)
  else
    puts "INPUT MISTAKE!"
    move(moves,round)
  end
end

# Randomly choose a vacant position
def compute_position(moves)
  avail_position(moves).sample
end

# Find a vacant position
def avail_position(moves)
   avail_position = Array.new
   moves.each_with_index do |input, index|
    if input == " "
      avail_position << index
    end
   end
   avail_position
end

# Determine who's turn it is
def judge_player(round)
  if round %2 == 0
    return "O"
  else
    return "X"
  end
end

# The conditions for winning
def finish?(moves)
  RESULT_LSIT.each do |result|
    if (moves[result[0]] == "X" && moves[result[1]] == "X" && moves[result[2]] == "X" ) || 
      (moves[result[0]] == "O" && moves[result[1]] == "O" && moves[result[2]] == "O" )
      return true, result
    end
  end
  return false
end

# determine who is the winner
def determine_the_winner(moves)
  arr = finish?(moves)
  if arr[0]
    winner = moves[arr[1][0]]
    return winner == "X" ? "YOU" : "COMPUTER"
  end
end

# Check the position you choosed is vacant and between 1 to 9
def checkPosition(moves, position)
  (0..8).include?(position) && moves[position] == " "
end

# Programme running procedure
puts "START A NEW GAME"
displayBoard((1..9).to_a)
moves = [" "] * 9
main(moves)

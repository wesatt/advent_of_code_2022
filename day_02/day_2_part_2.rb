require 'pry'

# A = Rock
# B = Paper
# C = Scissors

# Rock +1
# Paper +2
# Scissors +3

# X = Lose +0
# Y = Draw +3
# Z = Win +6

class RPSGame
  def initialize(list)
    @list = list
  end

  def turn(opponent, player)
    if opponent == "A" #rock
      if player == "X" #lose +0, scissors +3
        {player: 3, opponent: 7}
      elsif player == "Y" #tie +3, rock +1
        {player: 4, opponent: 4}
      elsif player == "Z" #win +6, paper +2
        {player: 8, opponent: 1}
      end
    elsif opponent == "B" #paper
      if player == "X" #lose +0, rock +1
        {player: 1, opponent: 8}
      elsif player == "Y" #tie +3, paper +2
        {player: 5, opponent: 5}
      elsif player == "Z" #win +6, scissors +3
        {player: 9, opponent: 2}
      end
    elsif opponent == "C" #scissors
      if player == "X" #lose +0, paper +2
        {player: 2, opponent: 9}
      elsif player == "Y" #tie +3, scissors +3
        {player: 6, opponent: 6}
      elsif player == "Z" #win +6, rock +1
        {player: 7, opponent: 3}
      end
    end
  end

  def round_score(input)
    opponent = input[0]
    player = input[-1]
    turn(opponent, player)
  end

  def final_scores
    scores = {player: [], opponent: []}
    @list.each do |round|
      result = round_score(round)
      scores[:player] << result[:player]
      scores[:opponent] << result[:opponent]
    end
    scores
  end
end

list = File.read("day_2_list.txt").split("\n")
game = RPSGame.new(list)
final_score = game.final_scores
final_player_score = final_score[:player].sum
final_opponent_score = final_score[:opponent].sum

puts "If I use the strategy guide CORRECTLY, my final score would be:"
puts final_player_score
puts "and my opponent would be:"
puts final_opponent_score
puts "which means I would:"
if final_player_score > final_opponent_score
  puts "WIN!"
elsif final_player_score == final_opponent_score
  puts "meh...tie."
else
  puts "What?! Lose?!"
end

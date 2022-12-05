require 'pry'

# A = Rock
# B = Paper
# C = Scissors

# X = Rock +1
# Y = Paper +2
# Z = Scissors +3

# Lose +0
# Draw +3
# Win +6

class RPSGame
  def initialize(list)
    @list = list
  end

  def turn(opponent, player)
    if opponent == "A" #rock
      if player == "X" #rock +1, tie +3
        {player: 4, opponent: 4}
      elsif player == "Y" #paper +2, win +6
        {player: 8, opponent: 1}
      elsif player == "Z" #scissors +3, lose +0
        {player: 3, opponent: 7}
      end
    elsif opponent == "B" #paper
      if player == "X" #rock +1, lose +0
        {player: 1, opponent: 8}
      elsif player == "Y" #paper +2, tie +3
        {player: 5, opponent: 5}
      elsif player == "Z" #scissors +3, win +6
        {player: 9, opponent: 2}
      end
    elsif opponent == "C" #scissors
      if player == "X" #rock +1, win +6
        {player: 7, opponent: 3}
      elsif player == "Y" #paper +2, lose +0
        {player: 2, opponent: 9}
      elsif player == "Z" #scissors +3, tie +3
        {player: 6, opponent: 6}
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

puts "If I use the strategy guide, my final score would be:"
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

class Game
  @posi1, @score1, @pos2, @score2 = 0, 0
  attr_accessor :pos1, :score1, :pos2, :score2
  def initialize(p1, s1, p2, s2)
    @pos1, @score1 = p1, s1
    @pos2, @score2 = p2, s2
  end
  def to_s
    '[' + @pos1.to_s + ',' + @score1.to_s + ' - ' + @pos2.to_s + ',' + @score2.to_s + ']'
  end
  def inspect
    to_s
  end
end

def throw_dice
  res = Hash.new 0
  [1,2,3].repeated_permutation(3).each do |x|
    res[x.sum] += 1
  end
  return res
end


P1_start, P2_start = 4, 7
$p1_wins, $p2_wins = 0, 0

# Num. of universes for each game state
games = Hash.new 0
games[Game.new(P1_start, 0, P2_start, 0)] = 1

turn = 1
until games.empty?
  puts "--- Turn #{turn}"
  
  next_games = Hash.new 0
  games.each do |game, n_games|
    throw_dice.each do |n_dice, n_dice_times|
      new_n_games = n_games * n_dice_times
      new_pos = ((turn % 2 == 0 ? game.pos2 : game.pos1) + n_dice - 1) % 10 + 1
      new_score = (turn % 2 == 0 ? game.score2 : game.score1) + new_pos

      if new_score >= 21
        $p1_wins += new_n_games if turn % 2 == 1
        $p2_wins += new_n_games if turn % 2 == 0
      else
        new_game = nil
        
        if turn % 2 == 1
          new_game = Game.new(new_pos, new_score, game.pos2, game.score2)
        else
          new_game = Game.new(game.pos1, game.score1, new_pos, new_score)
        end

        next_games[new_game] += new_n_games
      end
    end
  end

  games = next_games
  turn += 1

 
  puts "P1: #{$p1_wins}"
  puts "P2: #{$p2_wins}"
  puts "#{games.length} games running"
  # break if turn == 3
end

puts "P1: #{$p1_wins}"
puts "P2: #{$p2_wins}"

# At throw i:
# ti = 3[3(i + 1) + 2] = 9i - 3
#
# Score at i:
# Si = S_{i-1} + [(S_{i-1} + ti - 1) % 10) + 1]

def throw_dice(i)
  return 9*i - 3
end

def pos(i, prev_p)
  return (prev_p + throw_dice(i) - 1) % 10 + 1
end

turn = 1
pos_p1, pos_p2 = 4, 7
score_p1, score_p2 = 0, 0

until score_p1 >= 1000 or score_p2 >= 1000
  if turn % 2 == 1
    new_pos_p1 = pos(turn, pos_p1)
    score_p1 += new_pos_p1
    pos_p1 = new_pos_p1
  else
    new_pos_p2 = pos(turn, pos_p2)
    score_p2 += new_pos_p2
    pos_p2 =  new_pos_p2
  end

  turn += 1
end

dice_rolls = (turn-1)*3
puts "Points: #{score_p1} - #{score_p2} at turn #{turn} (=#{dice_rolls} dice rolls)"
puts "Ans: #{dice_rolls * [score_p1,score_p2].min}"

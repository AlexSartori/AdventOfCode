stream = gets.strip.split(',')
boards = []

# Load matrices
rows = []
while line = gets  do
  line = line.strip

  if line != '' then
    rows.append line.split
  elsif rows.length > 0
    boards.append(rows)
    rows = []
  end
end

def play_and_check (x, y, b)
  b[y][x] = 'X'
  return (b[y].join == 'XXXXX' or b.transpose[x].join == 'XXXXX')
end

def calc_score (b)
  res = 0
  b.each do |row|
    res += row.select{|x| x != 'X'}.map(&:to_i).sum
  end
  return res
end

last_win_idx = -1
last_win_n = -1
already_won = []

stream.each do |n|
  # Check boards
  boards.each_with_index do |b, b_i|
    b.each_with_index do |row, y|
      if x = row.find_index(n)
        if already_won.index(b_i) == nil and play_and_check(x, y, b)
          last_win_idx = b_i
          last_win_n = n.to_i
          already_won.append b_i
        end
      end
    end
  end
end

score = last_win_n * calc_score(boards[last_win_idx])
puts "Last board to win: ##{last_win_idx} with score #{score} after extracting #{last_win_n}"

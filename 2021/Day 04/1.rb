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

stream.each do |n|
  # Check boards
  boards.each_with_index do |b, b_i|
    b.each_with_index do |row, y|
      if x = row.find_index(n)
        if play_and_check x, y, b
          puts "WIN: board ##{b_i}"
          score = n.to_i * calc_score(b)
          puts "Score: #{score}"
          return            
        end
      end
    end
  end
end

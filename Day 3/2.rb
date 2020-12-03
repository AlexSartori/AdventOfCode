lines = File.read("input").split

max_x = lines[0].length
max_y = lines.length - 1

result = 1

for sx, sy in [[1, 1], [3, 1], [5, 1], [7, 1], [1, 2]]
    x = 0
    y = 0
    tot_trees = 0

    begin
        x = (x + sx) % max_x
        y += sy
        l = lines[y]
        c = l[x]

        if c == '#'
            tot_trees += 1
        end
    end while y < max_y

    puts "Trees: #{tot_trees}"
    result *= tot_trees
end

puts "Final result: #{result}"

lines = File.read("input").split

x = 0
y = 0
max_x = lines[0].length
max_y = lines.length - 1

tot_trees = 0

begin
    x = (x + 3) % max_x
    y += 1
    l = lines[y]
    c = l[x]

    if c == '#'
        tot_trees += 1
    end
end while y < max_y

puts "Trees: #{tot_trees}"

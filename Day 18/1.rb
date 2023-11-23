coords = STDIN.read.split("\n").map{|line| line.strip.split(',').map &:to_i}

max_x, max_y, max_z = 0, 0, 0
coords.each do |x, y, z|
    max_x = [max_x, x].max
    max_y = [max_y, y].max
    max_z = [max_z, z].max
end

mat = []
w, h, d = max_x+1, max_y+1, max_z+1
for z in (0...d) do
    plane = []
    for y in (0...h) do
        plane.append [0]*w
    end
    mat.append plane
end

coords.each do |x, y, z|
    mat[z][y][x] = 1
end


tot_surf = 0
mat.each_with_index do |plane, z|
    
    plane.each_with_index do |row, y|
        for x in (0...w) do
            next if row[x] == 0
            
            # Check sides of the cube
            tot_surf += 1 if x == 0   or row[x-1] == 0 # L
            tot_surf += 1 if x == w-1 or row[x+1] == 0 # R
            tot_surf += 1 if y == 0   or plane[y-1][x] == 0 # T
            tot_surf += 1 if y == h-1 or plane[y+1][x] == 0 # B
            
            # Check above
            tot_surf += 1 if z == 0 or mat[z-1][y][x] == 0 # A
            
            # Check below
            tot_surf += 1 if z == d-1 or mat[z+1][y][x] == 0 # B
        end
    end
    
end

puts "Tot surface: #{tot_surf}"

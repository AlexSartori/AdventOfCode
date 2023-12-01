class Node
    attr_accessor :name, :parent, :size, :children
    
    def initialize(n, p, s)
        @name = n
        @parent = p
        @size = s
        @children = Hash.new
    end
    
    def dir?
        return @size == 0
    end
    
    def get_size
        return dir? ? children.values.map(&:get_size).sum : @size
    end
end

root = Node.new '/', nil, 0
cwd = root

while line = gets do
    if line[0] == '$'
        cmd = line.strip.split ' '
        if cmd[1] == 'cd'
            dir = cmd[2]
            if dir == '/'
                cwd = root
            elsif dir == '..'
                cwd = cwd.parent
            else
                cwd = cwd.children[cmd[2]]
            end
        end
    else # File/Dir entry
        x, name = line.strip.split ' '
        new_node = Node.new name, cwd, (x == 'dir' ? 0 : x.to_i)
        cwd.children[name] = new_node
    end
end

free_space = 7e7 - root.get_size
needed_space = 3e7 - free_space
dir_queue = [root]
all_dirs = []

until dir_queue.empty? do
    d = dir_queue.pop
    
    if d.get_size >= needed_space
        all_dirs.append d
    end
    
    dir_queue += d.children.values.select{ |d| d.dir? && d.get_size >= needed_space }
end

best_dir = all_dirs.min{ |d1,d2| d1.get_size <=> d2.get_size }
p best_dir.get_size

class Node
    attr_accessor :name, :parent, :size, :children
    
    def initialize(n, p, s)
        @name = n
        @parent = p
        @size = s
        @children = Hash.new
    end
    
    def get_size
        return @size + children.values.map(&:get_size).sum
    end
    
    def get_small_dirs
        dirs = children.select{|name,node| node.get_size <= 1e5 and node.size == 0}.values
        return dirs + children.values.map(&:get_small_dirs).flatten
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
    else
        x, name = line.strip.split ' '
        new_node = Node.new name, cwd, (x == 'dir' ? 0 : x.to_i)
        cwd.children[name] = new_node
    end
end

dirs = root.get_small_dirs
p dirs.map(&:get_size).sum


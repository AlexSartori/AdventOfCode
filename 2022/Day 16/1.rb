class Valve
    attr_accessor :name, :flow, :tunnels
    
    def initialize name, flow, tunnels
        @name = name
        @flow = flow
        @tunnels = tunnels
    end
end


valves = Hash.new
while l = gets
    name, flow, links = /^Valve ([A-Z]+) .+ rate=([0-9]+); .+ valves? (.+)$/.match(l).captures
    valves.store name, Valve.new(name, flow.to_i, links.split(", "))
end

t = 0
# front -> [node seq, opened_valves, tot_flow]
fronts = [ [['AA'], [], 0] ]

until t == 30 do
    puts "Situation at t: #{t}"
    new_fronts = []
    
    fronts.each do |path, open_valves, tot_flow|
        tot_flow += open_valves.map{|v| valves[v].flow}.sum
        puts "    Front with flow #{tot_flow}: #{path.join ','} (of which open: #{open_valves.join ','})"
        last = valves[path[-1]]
        
        # 1. If not already opened, open this valve
        if not open_valves.include? last.name
            new_fronts << [path, open_valves + [last.name], tot_flow]
        end
        
        # 2. Move to the neighbors
        last.tunnels.each do |t|
            # Check that no one has arrived here with better flow
            # and delete those who are here with worse flow
            add = true
            f_idx = 0
            
            while f_idx < new_fronts.count do
                p, _, f = new_fronts[f_idx]
                
                if p[-1] == t
                    if f >= tot_flow
                        add = false
                    else
                        new_fronts.delete_at f_idx
                    end
                end
                
                f_idx += 1
            end
            
            if add
                new_fronts << [path + [t], open_valves, tot_flow]
            end
        end
    end
    
    fronts = new_fronts
    t += 1
end

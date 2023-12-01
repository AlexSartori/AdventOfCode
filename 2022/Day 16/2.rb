class Valve
    attr_accessor :name, :flow, :tunnels
    
    def initialize name, flow, tunnels
        @name = name
        @flow = flow
        @tunnels = tunnels
    end
end

class Pivot
    attr_accessor :open_valves, :predicted_flow
end

valves = Hash.new
while l = gets
    name, flow, links = /^Valve ([A-Z]+) .+ rate=([0-9]+); .+ valves? (.+)$/.match(l).captures
    valves.store name, Valve.new(name, flow.to_i, links.split(", "))
end

t = 0
pivots = []

until t == 26 do

end


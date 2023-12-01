class Sensor
    attr_accessor :sx, :sy, :bx, :by
    
    def initialize sx, sy, bx, by
        @sx, @sy = sx, sy
        @bx, @by = bx, by
    end
    
    def get_dist_to_beacon
        return self.get_dist_to @bx, @by
    end
    
    def get_dist_to_y y
        return (@sy-y).abs
    end
    
    def get_dist_to x, y
        return (@sx-x).abs + (@sy-y).abs
    end
end

def try_join_intervals a, b
    # Assumption: a.x1 <= b.x1
    if a[1] >= b[0]
        return [a[0], [a[1], b[1]].max]
    else
        return nil
    end
end

sensors = []
Y = 2000000
beacons_on_Y = []

while l = gets
    coords = /.+x=(-?[0-9]+), y=(-?[0-9]+).+x=(-?[0-9]+), y=(-?[0-9]+)/.match(l).captures.map &:to_i
    sensors.append Sensor.new *coords
    beacons_on_Y.append coords[-2..] if coords[-1] == Y and not beacons_on_Y.include? coords[-2..]
end

# 1. Get sensors that are closer to Y (any point) than their beacon
sensors.select!{ |s|
    s.get_dist_to_y(Y) < s.get_dist_to_beacon
}

# 2. Closer points on Y than the beacon are the solution
implausible_intervals = []

sensors.each do |s|
    dx = (s.sx - s.bx).abs # Horizontal distance between sensor and beacon
    delta = s.get_dist_to_beacon - (s.sy - Y).abs
    dy = s.by - Y # Vertical distance between sensor and target row
    interval = [s.sx-delta, s.sx+delta] # Interval of the target row that is covered by the sensor
    implausible_intervals << interval
end

sol = []
implausible_intervals.sort.each do |i|
    if sol.empty?
        sol << i
    else
        j = try_join_intervals sol[-1], i
        
        if j.nil?
            sol << i
        else
            sol.pop
            sol << j
        end
    end
end

p sol
p sol.sum {|i| i[1] - i[0] + 1} - beacons_on_Y.size

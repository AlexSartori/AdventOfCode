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
    if a[1] >= b[0] - 1
        return [a[0], [a[1], b[1]].max]
    else
        return nil
    end
end

sensors = []

while l = gets
    coords = /.+x=(-?[0-9]+), y=(-?[0-9]+).+x=(-?[0-9]+), y=(-?[0-9]+)/.match(l).captures.map &:to_i
    sensors.append Sensor.new *coords
end

for y in 0..4000000 do
    implausible_intervals = []

    sensors.each do |s|
        dx = (s.sx - s.bx).abs # Horizontal distance between sensor and beacon
        delta = s.get_dist_to_beacon - (s.sy - y).abs
        interval = [s.sx-delta, s.sx+delta] # Interval of the target row that is covered by the sensor
        implausible_intervals.append interval unless interval[1] < interval[0]
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

    if sol.size > 1
        p (sol[1][0] - 1)*4000000 + y
    end
end

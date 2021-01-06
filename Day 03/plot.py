import matplotlib.pyplot as plt


def to_coords(wire):
    x, y = 0, 0
    coords = [(x, y)]
    for instr in wire.split(','):
        dir, val = instr[0], int(instr[1:])

        if dir == 'R' or dir == 'L':
            x += val * (1 if dir == 'R' else -1)
        elif dir == 'U' or dir == 'D':
            y += val * (1 if dir == 'D' else -1)

        coords.append((x, y))
    return coords


wire1, wire2 = open('input').readlines()
wire1 = to_coords(wire1)
wire2 = to_coords(wire2)
intersections = [(258, 0), (433, 0), (990, -153), (738, -408), (433, -408), (639, -408), (496, -683), (731, -683), (890, -1260), (890, -754), (890, -708), (890, -915), (890, -1208), (1166, -1367), (939, -1367), (1327, -1787), (1327, -1888), (1327, -1961), (1327, -1848), (1327, -1942), (1327, -2147), (1435, -2340), (1435, -2757), (2065, -2757), (2478, -3499), (2478, -3463), (2906, -3463), (3476, -2719), (3272, -1352), (3272, -1220), (2744, -1188), (1938, -1348), (2242, -1348), (2400, -1348), (1938, -1454), (2194, -1454), (2290, -1469), (2290, -1530), (2290, -2018), (2290, -1474), (2371, -2231), (2419, -2151), (3031, -2719), (2727, -2855), (2727, -2990), (2862, -2719), (3026, -2719), (3240, -3670), (3714, -3889), (4093, -3912), (5702, -3531), (5702, -3178), (5581, -3167), (4888, -3326), (2313, -3999), (2119, -3700), (2104, -3700), (1389, -3807), (2308, -3999), (2119, -3996), (2119, -3779), (2119, -3988)]

plt.plot(list(v[0] for v in wire1), list(v[1] for v in wire1), alpha=0.6, c='lime', label='Wire 1')
plt.plot(list(v[0] for v in wire2), list(v[1] for v in wire2), alpha=0.6, c='orange', label='Wire 2')
plt.scatter([0], [0], c='k', s=100, marker='x', label='Origin')
plt.scatter(list(v[0] for v in intersections), list(v[1] for v in intersections), c='red', s=50, marker='x', label='Intersections')
plt.legend()
plt.tight_layout()
plt.show()

matrix = {}


def flip(x, y):
    if y not in matrix:
        matrix[y] = {}
    if x not in matrix[y]:
        matrix[y][x] = 0
    matrix[y][x] = 1 - matrix[y][x]


def line_to_moves(line):
    i = 0
    while i < len(line):
        if line[i] in ['e', 'w']:
            yield line[i]
        elif line[i] in ['n', 's']:
            yield line[i] + line[i+1]
            i += 1
        i += 1


def move(x, y, m):
    if len(m) == 1:
        x += 2 if m == 'e' else -2
    elif len(m) == 2:
        x += 1 if 'e' in m else -1
        y += 1 if 's' in m else -1
    return x, y


def get_neighbors(x, y):
    for m in ['e', 'w', 'ne', 'nw', 'se', 'sw']:
        _x, _y = move(x, y, m)
        if _y in matrix and _x in matrix[_y]:
            yield matrix[_y][_x]
        else:
            yield 0


def next_day():
    global matrix, y_min, y_max, x_min, x_max
    new_m = matrix.copy()
    for y in new_m.keys():
        new_m[y] = matrix[y].copy()

    y_min -= 1
    y_max += 1
    x_min -= 1
    x_max += 1

    for y in range(y_min, y_max+1):
        if y not in matrix:
            matrix[y] = {}
            new_m[y] = {}

        for x in range(x_min, x_max+1):
            if x not in new_m[y]:
                new_m[y][x] = 0

            tile = 0
            if y in matrix and x in matrix[y]:
                tile = matrix[y][x]

            n = list(get_neighbors(x, y))
            if tile == 1 and (n.count(1) == 0 or n.count(1) > 2):
                new_m[y][x] = 0
            elif tile == 0 and n.count(1) == 2:
                new_m[y][x] = 1

    while sum(new_m[y_min].values()) == 0:
        del new_m[y_min]
        y_min += 1
    while sum(new_m[y_max].values()) == 0:
        del new_m[y_max]
        y_max -= 1

    matrix = new_m


for moves in map(line_to_moves, open('input')):
    x, y = 0, 0
    for m in moves:
        x, y = move(x, y, m)
    flip(x, y)

y_min, y_max = min(matrix.keys()), max(matrix.keys())
x_min, x_max = 0, 0
for y in matrix.keys():
    if len(matrix[y].keys()) > 0:
        x_min = min(x_min, min(matrix[y].keys()))
        x_max = max(x_max, max(matrix[y].keys()))

for day in range(100+1):
    res = sum(sum(row.values()) for row in matrix.values())
    if day % 10 == 0:
        print("Day", day, "->", res)
    next_day()

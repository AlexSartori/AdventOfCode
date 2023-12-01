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


for moves in map(line_to_moves, open('input')):
    x, y = 0, 0
    for m in moves:
        if len(m) == 1:
            x += 2 if m == 'e' else -2
        elif len(m) == 2:
            x += 1 if 'e' in m else -1
            y += 1 if 's' in m else -1
    flip(x, y)

res = sum(sum(row.values()) for row in matrix.values())
print(res)

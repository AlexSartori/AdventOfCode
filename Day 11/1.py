matrix = list(map(list, open('input')))
W, H = len(matrix[0]), len(matrix)


def get_adjacent(x, y):
    for yy in range(max(0, y-1), min(H, y+2)):
        for xx in range(max(0, x-1), min(W, x+2)):
            if xx == x and yy == y:
                continue
            yield matrix[yy][xx]


becomes_occupied = lambda x, y: '#' not in get_adjacent(x, y)
becomes_empty = lambda x, y: list(get_adjacent(x, y)).count('#') >= 4
changed = True

while changed:
    changed = False
    new_m = [row[:] for row in matrix]

    for y in range(H):
        for x in range(W):
            seat = matrix[y][x]
            if seat == 'L' and becomes_occupied(x, y):
                new_m[y][x] = '#'
                changed = True
            elif seat == '#' and becomes_empty(x, y):
                new_m[y][x] = 'L'
                changed = True

    matrix = new_m

print(sum(row.count('#') for row in matrix))

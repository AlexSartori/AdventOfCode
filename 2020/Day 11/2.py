matrix = list(map(list, open('input')))
W, H = len(matrix[0]), len(matrix)


def move(x, y, dir):
    if dir == 'l':
        return (x-1, y)
    elif dir == 'r':
        return (x+1, y)
    elif dir == 'u':
        return (x, y-1)
    elif dir == 'd':
        return (x, y+1)
    elif dir == 'ul':
        return (x-1, y-1)
    elif dir == 'ur':
        return (x+1, y-1)
    elif dir == 'dl':
        return (x-1, y+1)
    elif dir == 'dr':
        return (x+1, y+1)


def get_in_sight(x, y):
    res = []

    for dir in ['l', 'r', 'u', 'd', 'ul', 'ur', 'dl', 'dr']:
        xx, yy = move(x, y, dir)

        while xx >= 0 and xx < W and yy >= 0 and yy < H:
            if matrix[yy][xx] != '.':
                res.append(matrix[yy][xx])
                break
            else:
                xx, yy = move(xx, yy, dir)

    return res


becomes_occupied = lambda x, y: '#' not in get_in_sight(x, y)
becomes_empty = lambda x, y: get_in_sight(x, y).count('#') >= 5
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

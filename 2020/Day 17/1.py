def get_shape(m):
    return len(m), len(m[0]), len(m[0][0])


def new_layer(h, w):
    return [['.']*w for _ in range(h)]


def clone_and_expand_layer(l):
    w = len(l[0]) + 2
    res = [['.']*w]
    [res.append(['.'] + row[:] + ['.']) for row in l]
    res.append(['.']*w)
    return res


def clone_and_expand_matrix(m):
    _, h, w = get_shape(m)
    res = [new_layer(h+2, w+2)]
    [res.append(clone_and_expand_layer(l)) for l in m]
    res.append(new_layer(h+2, w+2))
    return res


def shrink_matrix(m):
    z0, y0, x0 = 0, 0, 0
    z1, y1, x1 = get_shape(m)

    while sum(row.count('#') for row in m[z0]) == 0:
        z0 += 1
    while sum(row.count('#') for row in m[z1-1]) == 0:
        z1 -= 1
    m = m[z0:z1]

    while sum(layer[y0].count('#') for layer in m) == 0:
        y0 += 1
    while sum(layer[y1-1].count('#') for layer in m) == 0:
        y1 -= 1
    m = [layer[y0:y1] for layer in m]

    while sum(1 for layer in m for row in layer if row[x0] == '#') == 0:
        x0 += 1
    while sum(1 for layer in m for row in layer if row[x1-1] == '#') == 0:
        x1 -= 1
    m = [[row[x0:x1] for row in layer] for layer in m]

    return m


def get_neighbors(m, x, y, z):
    d, h, w = get_shape(m)
    res = []

    for z_off in [-1, 0, 1]:
        if z + z_off < 0 or z + z_off >= d:
            continue

        for y_off in [-1, 0, 1]:
            if y + y_off < 0 or y + y_off >= h:
                continue

            for x_off in [-1, 0, 1]:
                if x + x_off < 0 or x + x_off >= w:
                    continue
                if z_off != 0 or y_off != 0 or x_off != 0:
                    res.append(m[z + z_off][y + y_off][x + x_off])
    #print("Neighbors of {}x{}x{}: {}".format(z, y, x, ' '.join(res)))
    return res


def process_cubes(m):
    new_m = clone_and_expand_matrix(m)
    d1, h1, w1 = get_shape(m)
    d2, h2, w2 = get_shape(new_m)

    for z in range(d2):
        for y in range(h2):
            for x in range(w2):
                if z-1 >= 0 and z-1 < d1 and y-1 >= 0 and y-1 < h1 and x-1 >= 0 and x-1 < w1:
                    curr = m[z-1][y-1][x-1]
                else:
                    curr = '.'

                # Check neigh. on (coords-1) bc matrix is expanded by 1 on each dim
                n_active = get_neighbors(m, x-1, y-1, z-1).count('#')
                if curr == '.' and n_active == 3:
                    new_m[z][y][x] = '#'
                elif curr == '#':
                    if n_active in [2, 3]:
                        new_m[z][y][x] = '#'
                    else:
                        new_m[z][y][x] = '.'
    return shrink_matrix(new_m)


def count_active(m):
    return sum(
        row.count('#') for layer in m for row in layer
    )


def printm(m):
    for z, layer in enumerate(m):
        print('\nz =', z)
        for row in layer:
            print(' '.join(row))


matrix = [list(line.strip()) for line in open('input')]
matrix = [matrix]

for cycle in range(6):
    z_lim = (0, len(matrix))
    y_lim = (0, len(matrix[0]))
    x_lim = (0, len(matrix[0][0]))

    print('\n' + '='*50)
    print("Cycle:", cycle+1)
    print("System: (X: 0 - {}) x (Y: 0 - {}) x (Z: 0 - {})".format(x_lim[1], y_lim[1], z_lim[1]))

    printm(matrix)
    matrix = process_cubes(matrix)

print("Result:", count_active(matrix))

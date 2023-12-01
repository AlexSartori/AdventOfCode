import math


class Image:
    def __init__(self, txt):
        self.id = None
        self.borders = None
        self.data = None

        if txt is not None:
            txt = txt.split('\n')
            self.id = int(txt[0][5:-1])
            self.data = txt[1:]
            self.borders = {
                'top': txt[1],
                'bottom': txt[-1],
                'left': ''.join(x[0] for x in txt[1:]),
                'right': ''.join(x[-1] for x in txt[1:])
            }

    def __str__(self):
        s = str(self.id)
        return s

    def clone(self):
        img = Image(None)
        img.id = self.id
        img.borders = self.borders.copy()
        img.data = [r[:] for r in self.data]
        return img


def transformed(i, t):
    if t is None:
        return i

    if t == 'rot_270_cw':
        new_img = transformed(i, 'rot_180_cw')
        t = 'rot_90_cw'
    elif t == 'rot_180_cw':
        new_img = transformed(i, 'rot_90_cw')
        t = 'rot_90_cw'
    else:
        new_img = i.clone()

    b = new_img.borders
    b_t, b_b, b_r, b_l = b['top'], b['bottom'], b['right'], b['left']
    if t == 'flip_h':
        new_img.data = [''.join(reversed(r[:])) for r in new_img.data]
        b['left'], b['right'] = b_r, b_l
        b['top'] = ''.join(reversed(b_t))
        b['bottom'] = ''.join(reversed(b_b))
    elif t == 'rot_90_cw':
        new_img.data = [''.join(r[j] for r in reversed(new_img.data)) for j in range(len(new_img.data))]
        b['top'] = ''.join(reversed(b_l))
        b['bottom'] = ''.join(reversed(b_r))
        b['left'] = b_b
        b['right'] = b_t

    return new_img


def place_at(img, x, y):
    b = img.borders
    s = solution

    # Return if illegal place
    if x > 0 and b['left'] != s[y][x-1].borders['right']:
        return False
    if y > 0 and b['top'] != s[y-1][x].borders['bottom']:
        return False

    s[y][x] = img
    return True


def get_candidates_for(x, y):
    candidates = []
    if x == 0 and y == 0:
        candidates = list(images.keys())
    else:
        l, t = [], []
        if x > 0:
            l = cache[solution[y][x-1].borders['right']]
        if y > 0:
            t = cache[solution[y-1][x].borders['bottom']]

        if x == 0:
            candidates = t
        elif y == 0:
            candidates = l
        else:
            for c in l:
                if c in t:
                    candidates.append(c)
    return list(set(c for c in candidates if not used[c]))


def place_next(x, y):
    next_x = (x+1) % len(solution[y])
    next_y = y + (1 if x+1 == len(solution[y]) else 0)

    candidates = get_candidates_for(x, y)

    for id in candidates:
        img = images[id]

        for t1 in [None, 'flip_h']:
            img_t1 = transformed(img, t1)
            for t2 in [None, 'rot_90_cw', 'rot_180_cw', 'rot_270_cw']:
                img = transformed(img_t1, t2)

                if place_at(img, x, y):
                    used[img.id] = True
                    if y == len(solution) - 1 and x == len(solution[y]) - 1:
                        write_solution_to_file()
                        print("Solution:")
                        print('\n'.join(' '.join(str(i) for i in s) for s in solution))
                        r1, r2 = solution[0], solution[-1]
                        id1, id2, id3, id4 = r1[0].id, r1[-1].id, r2[0].id, r2[-1].id
                        print("\nRes:", id1*id2*id3*id4)
                        exit()
                    place_next(next_x, next_y)
                    solution[y][x] = None
                    used[img.id] = False


def solve(images):
    for id in images.keys():
        used[id] = False
    place_next(0, 0)
    print("Solved:", solved)


def write_solution_to_file():
    f = open('composition', 'w')

    for sol_row in solution:
        for img_row_idx in range(1, len(sol_row[0].data) - 1):
            for img in sol_row:
                f.write(img.data[img_row_idx][1:-1])
            f.write('\n')
    f.close()


images = {}
cache = {}
used = {}
ids = []

for matrix in open('input').read().strip().split('\n\n'):
    i = Image(matrix)
    images[i.id] = i
    ids.append(i.id)
    for b in i.borders.values():
        for bb in [b, ''.join(reversed(b))]:
            if bb not in cache:
                cache[bb] = []
            cache[bb].append(i.id)

A = len(images)
side = int(math.sqrt(A))
solution = [[None]*side for _ in range(side)]
solved = False
solve(images)

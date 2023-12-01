class Image:
    def __init__(self, data):
        if data is None:
            data = []
        else:
            rows = data.split('\n')
            self.data = list(list(r) for r in rows)

    def clone(self):
        img = Image(None)
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

    if t == 'flip_h':
        new_img.data = [list(reversed(r[:])) for r in new_img.data]
    elif t == 'rot_90_cw':
        new_img.data = [list(r[j] for r in reversed(new_img.data)) for j in range(len(new_img.data))]

    return new_img


def find_monster(image):
    img = image.data
    h, w = len(img), len(img[0])
    matches = 0

    for y_i in range(h):
        for x_i in range(w):
            found = True
            for y_m in range(len(monster)):
                if y_i + y_m == h:
                    found = False
                    break
                for x_m in range(len(monster[y_m])):
                    if x_i + x_m == w:
                        found = False
                        break
                    if monster[y_m][x_m] == '#' and img[y_i + y_m][x_i + x_m] != '#':
                        found = False
                        break
            if not found:
                continue

            for y_m in range(len(monster)):
                for x_m in range(len(monster[y_m])):
                    if monster[y_m][x_m] == '#':
                        img[y_i + y_m][x_i + x_m] = 'O'
            matches += 1
            x_i += x_m
    return matches


image = Image(open('composition').read().strip())
monster = [
    '                  # ',
    '#    ##    ##    ###',
    ' #  #  #  #  #  #   '
]

for t1 in [None, 'flip_h']:
    img_t1 = transformed(image, t1)
    for t2 in [None, 'rot_90_cw', 'rot_180_cw', 'rot_270_cw']:
        img_t2 = transformed(img_t1, t2)
        m = find_monster(img_t2)

        if m > 0:
            for row in img_t2.data:
                s = ' '.join(row)
                s = s.replace('O', '\u001b[38;5;64m\u001b[1mO\u001b[0m\u001b[38;5;44m')
                s = '\u001b[38;5;44m' + s.replace('#', '~').replace('.', '_') + '\u001b[0m'
                print(s)
            print(sum(r.count('#') for r in img_t2.data))

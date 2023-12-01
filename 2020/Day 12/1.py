instructions = map(lambda l: (l[:1], int(l[1:])), open('input'))
coeff = {'N': (0, -1), 'E': (1, 0), 'S': (0, 1), 'W': (-1, 0)}
facing = 'E'
X, Y = 0, 0

def rotate(amount):
    global facing
    cardinals = ['N', 'E', 'S', 'W']
    idx = (cardinals.index(facing) + amount//90) % 4
    facing = cardinals[idx]

def move(amount, dir):
    global X, Y
    xc, yc = coeff[dir]
    X += amount * xc
    Y += amount * yc

for dir, val in instructions:
    if dir == 'R':
        rotate(val)
    elif dir == 'L':
        rotate(-val)
    elif dir == 'F':
        move(val, facing)
    else:
        move(val, dir)

print(abs(X) + abs(Y))

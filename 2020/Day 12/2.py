instructions = map(lambda l: (l[:1], int(l[1:])), open('input'))
coeff = {'N': (0, -1), 'E': (1, 0), 'S': (0, 1), 'W': (-1, 0)}
shipX, shipY = 0, 0
wayX, wayY = 10, -1

def rotate_waypoint(amount):
    global wayX, wayY
    diffX, diffY = wayX - shipX, wayY - shipY
    for i in range(amount//90):
        tmp = diffX
        diffX = -diffY
        diffY = tmp
    wayX = shipX + diffX
    wayY = shipY + diffY

def move_waypoint(amount, dir):
    global wayX, wayY
    xc, yc = coeff[dir]
    wayX += amount * xc
    wayY += amount * yc

def move_ship(amount):
    global shipX, shipY, wayX, wayY
    diffX, diffY = wayX - shipX, wayY - shipY
    shipX += diffX * amount
    shipY += diffY * amount
    wayX = shipX + diffX
    wayY = shipY + diffY

for dir, val in instructions:
    if dir == 'R':
        rotate_waypoint(val)
    elif dir == 'L':
        rotate_waypoint(360-val)
    elif dir == 'F':
        move_ship(val)
    else:
        move_waypoint(val, dir)

print(abs(shipX) + abs(shipY))

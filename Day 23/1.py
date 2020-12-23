class ListNode:
    def __init__(self, val, next):
        self.value = val
        self.next = next

    def __str__(self):
        s = str(self.value)
        cursor = self.next
        while cursor != self:
            s += ' 🡒 ' + str(cursor.value)
            cursor = cursor.next
        return s + ' 🡒 (' + str(self.value) + ')'


def str_to_game(input):
    game = ListNode(None, None)
    _last = game
    _last.value = int(input[0])
    for x in input[1:]:
        _last.next = ListNode(int(x), None)
        _last = _last.next
    _last.next = game
    return game


def pick_three(game):
    picked = game

    # Close game circle
    game_last = game
    while game_last.next != game:
        game_last = game_last.next
    game = game.next.next.next
    game_last.next = game

    picked.next.next.next = picked
    return picked, game


def pick_destination(curr_v, game):
    closest, max = None, game
    cursor = game
    while cursor.next != game:
        v = cursor.value
        if v < curr_v and (closest is None or curr_v - v < curr_v - closest.value):
            closest = cursor
        if v > max.value:
            max = cursor
        cursor = cursor.next
    return closest if closest is not None else max


def place_picked(picked, dest):
    picked.next.next.next = dest.next
    dest.next = picked


# game = str_to_game('389125467') # Example
game = str_to_game('362981754')
current = game

for turn in range(100):
    print("{:=^50}".format(' Turn ' + str(turn) + ' '))
    print("  Cups:", game)
    print("  Current:", current.value)
    picked, remaining = pick_three(current.next)
    print("  Picked:", picked)
    destination = pick_destination(current.value, remaining)
    print("  Destination:", destination.value)
    place_picked(picked, destination)
    current = current.next

print("\n" + '~'*50)
print("Final:", game)

cursor = game
while cursor.value != 1:
    cursor = cursor.next
cursor = cursor.next
result = ''
while cursor.value != 1:
    result += str(cursor.value)
    cursor = cursor.next
print("Result:", result)

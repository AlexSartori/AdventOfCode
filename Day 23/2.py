class ListNode:
    def __init__(self, val, prev, next):
        self.value = val
        self.next = next
        self.prev = prev

    def __str__(self):
        s = str(self.value)
        cursor = self.next
        for i in range(5):
            assert cursor.next.prev == cursor
            s += ' ⮀ ' + str(cursor.value)
            cursor = cursor.next
            if cursor == self:
                return s + ' ⮀ (' + str(self.value) + ')'
        return s + ' ⮀ ... ⮀ (' + str(self.value) + ')'


def str_to_game(input):
    cache = {}
    game = ListNode(None, None, None)

    curr = game
    curr.value = int(input[0])
    cache[int(input[0])] = curr

    for x in input[1:]:
        curr.next = ListNode(int(x), curr, None)
        curr = curr.next
        cache[int(x)] = curr

    for x in range(10, int(1e6+1)):
        curr.next = ListNode(int(x), curr, None)
        curr = curr.next
        cache[int(x)] = curr
    curr.next = game
    game.prev = curr
    return game, cache


def pick_three(game):
    picked = game
    game.prev.next = game.next.next.next
    game.next.next.next.prev = game.prev

    picked.next.next.next = picked
    picked.prev = picked.next.next

    return picked, game


def pick_destination(curr_v, game):
    picked_cache = [picked.value, picked.next.value, picked.next.next.value]
    curr_v -= 1
    while curr_v in picked_cache or curr_v == 0:
        curr_v -= 1
        if curr_v <= 0:
            curr_v = 1e6
    return node_cache[curr_v]


def place_picked(picked, dest):
    picked.prev.next = dest.next
    dest.next.prev = picked.prev
    dest.next = picked
    picked.prev = dest


# game, node_cache = str_to_game('389125467') # Example
game, node_cache = str_to_game('362981754')
current = game

for turn in range(int(1e7)):
    picked, remaining = pick_three(current.next)
    destination = pick_destination(current.value, remaining)
    place_picked(picked, destination)

    if turn % 5e5 == 0:
        print("{:=^70}".format(' Turn ' + str(turn) + ' '))
        print("  Cups:", game)
        print("  Current:", current.value)
        print("  Picked:", picked)
        print("  Destination:", destination.value)
    current = current.next

print("\n" + '~'*70)
one = node_cache[1]
result = one.next.value * one.next.next.value
print("Result:", result)

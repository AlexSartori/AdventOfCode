# Parse deck as a stack, last is top
def parse_deck(d):
    d = map(int, d.split('\n')[1:])
    return list(reversed(list(d)))


def play_game(d1, d2):
    while len(d1) > 0 and len(d2) > 0:
        c1, c2 = d1.pop(), d2.pop()
        if c1 > c2:
            d1.insert(0, c1)
            d1.insert(0, c2)
        else:
            d2.insert(0, c2)
            d2.insert(0, c1)
    return d1, d2


deck1, deck2 = open('input').read().strip().split('\n\n')
deck1, deck2 = parse_deck(deck1), parse_deck(deck2)
deck1, deck2 = play_game(deck1, deck2)

winner = deck1 if len(deck1) != 0 else deck2
score = sum(c*(i+1) for i, c in enumerate(winner))
print(score)

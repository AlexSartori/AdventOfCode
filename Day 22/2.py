# Parse deck as a stack, last is top
def parse_deck(d):
    d = map(int, d.split('\n')[1:])
    return list(reversed(list(d)))


def play_game(d1, d2):
    prev_rounds = {}

    while len(d1) > 0 and len(d2) > 0:
        hash1, hash2 = ' '.join(str(c) for c in d1), ' '.join(str(c) for c in d2)
        if hash1 in prev_rounds:
            if hash2 in prev_rounds[hash1]:
                return (1, d1, d2)
            else:
                prev_rounds[hash1].append(hash2)
        else:
            prev_rounds[hash1] = [hash2]

        c1, c2 = d1.pop(), d2.pop()

        if c1 <= len(d1) and c2 <= len(d2):
            winner, _d1, _d2 = play_game(d1[-c1:], d2[-c2:])
        else:
            winner = (1 if c1 > c2 else 2)

        c1, c2 = (c1, c2) if winner == 1 else (c2, c1)
        if winner == 1:
            d1.insert(0, c1)
            d1.insert(0, c2)
        else:
            d2.insert(0, c1)
            d2.insert(0, c2)

    return (1 if len(d2) == 0 else 2, d1, d2)


deck1, deck2 = open('input').read().strip().split('\n\n')
deck1, deck2 = parse_deck(deck1), parse_deck(deck2)

w_idx, d1, d2 = play_game(deck1, deck2)
winner = (d1, d2)[w_idx-1]
score = sum(c*(i+1) for i, c in enumerate(winner))
print(score)

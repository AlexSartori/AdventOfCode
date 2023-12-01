import re


class Field:
    def __init__(self, line):
        x = re.findall(
            '(.+): ([0-9]+)-([0-9]+) or ([0-9]+)-([0-9]+)',
            line
        )[0]
        self.name = x[0]
        self.ranges = [int(x[1]), int(x[2]), int(x[3]), int(x[4])]

    def check_val(self, v):
        r = self.ranges
        return (v >= r[0] and v <= r[1]) or (v >= r[2] and v <= r[3])


def is_valid_any_field(val):
    for field in fields:
        if field.check_val(int(val)):
            return True
    return False


def is_ticket_valid(ticket):
    for val in ticket:
        if not is_valid_any_field(val):
            return False
    return True


def get_valid_tickets(txt):
    for line in txt.strip().split('\n')[1:]:
        ticket = [int(v) for v in line.split(',')]
        if is_ticket_valid(ticket):
            yield ticket


sections = open('input').read().split('\n\n')
fields = list(map(Field, sections[0].split('\n')))
my_ticket = list(map(int, sections[1].split('\n')[1].split(',')))
tickets = list(get_valid_tickets(sections[2]))
compatibilities = {}

for field in fields:
    compatibilities[field.name] = [0]*len(fields)
    for idx in range(len(fields)):
        valid = 1
        for t in tickets:
            if not field.check_val(t[idx]):
                valid = 0
                break
        compatibilities[field.name][idx] = valid

f_idx = {}
while True:
    to_do = -1
    for f, c in compatibilities.items():
        if sum(c) == 1:
            to_do = (f, c.index(1))
            f_idx[f] = c.index(1)

    if to_do == -1:
        break
    else:
        del compatibilities[to_do[0]]
        for f in compatibilities.keys():
            compatibilities[f][to_do[1]] = 0

result = 1
print('\n .' + '='*30 + '.')
print(" |{:^30}|".format("Ticket"))
print(' +' + '='*30 + '+')
print(" |{:<20}{:>3}{:>7}|".format("Field", "Idx", "Value"))
print(' |' + '<>'*15 + '|')
for f in f_idx.keys():
    if f.split(' ')[0] == 'departure':
        print(" |{:.<20}{:.>3d}{:.>7d}|".format(f, f_idx[f], my_ticket[f_idx[f]]))
        result *= my_ticket[f_idx[f]]
print(' \'' + '='*30 + '\'')
print("\nResult:", result)

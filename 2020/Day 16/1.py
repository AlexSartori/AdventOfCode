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


sections = open('input').read().split('\n\n')
fields = list(map(Field, sections[0].split('\n')))

error_rate = 0
for ticket in sections[2].strip().split('\n')[1:]:
    for val in ticket.split(','):
        if not is_valid_any_field(val):
            error_rate += int(val)
print(error_rate)

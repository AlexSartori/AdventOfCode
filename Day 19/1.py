rules = {}


def parse_rules(lines):
    for l in lines:
        name, rule = l.split(': ')
        rules[name] = []

        for r in rule.split(' | '):
            if r in ['"a"', '"b"']:
                rules[name] = r[1:-1]
            else:
                rules[name].append(r.split(' '))


def match(txt, r_name):
    if rules[r_name] in ['a', 'b']:
        if txt[0] == rules[r_name]:
            return 1
        else:
            return 0

    idxs = []
    for ruleset in rules[r_name]:
        idx = 0
        for rule in ruleset:
            m = match(txt[idx:], rule)
            if m != 0:
                idx += m
            else:
                break
        idxs.append(idx)
    return max(idxs)


r, messages = open('input').read().split('\n\n')
parse_rules(r.split('\n'))

tot = 0
for m in messages.split('\n'):
    if m != '' and match(m, '0') == len(m):
        tot += 1
print(tot)

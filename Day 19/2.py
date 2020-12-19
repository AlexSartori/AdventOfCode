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


def match(txt, r_name, i):
    # print(' '*i, "Match:", txt, "with:", r_name)
    if len(txt) == 0:
        return [0]
    if rules[r_name] in ['a', 'b']:
        if txt[0] == rules[r_name]:
            return [1]
        else:
            return [0]

    results = []
    # print(' '*i, "Ruleset:", ' | '.join(' '.join(r) for r in rules[r_name]))
    for ruleset in rules[r_name]:
        # print(' '*i, "Rule:", ' '.join(ruleset))
        ruleset_matches = [0]

        for rule in ruleset:
            rule_matches = []
            for curr_idx in ruleset_matches:
                for m in match(txt[curr_idx:], rule, i+4):
                    if m != 0:
                        rule_matches.append(curr_idx + m)
            ruleset_matches = rule_matches

        results.append(ruleset_matches)
    r = set(idx for rs in results for idx in rs)
    # print(' '*i, "Result:", r)
    return r


r, messages = open('input').read().split('\n\n')
parse_rules(r.split('\n'))
rules['8'] = [['42'], ['42', '8']]
rules['11'] = [['42', '31'], ['42', '11', '31']]

tot = 0
for m in messages.split('\n'):
    if m != '' and len(m) in match(m, '0', 0):
        tot += 1
print(tot)

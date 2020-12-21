def parse_line(line):
    a, b = line.split(' (contains ')
    return a.split(' '), b[:-1].split(', ')


def intersect(foods):
    result = []

    x = foods[0]
    for ing in x:
        ok = True
        for j in range(1, len(foods)):
            if ing not in foods[j]:
                ok = False
        if ok:
            result.append(ing)
    return result


food_by_all = {}
ingredients_by_line = []
for line in open('input'):
    if line == '':
        break
    ing, all = parse_line(line.strip())
    ingredients_by_line.append(ing)

    for a in all:
        if a not in food_by_all:
            food_by_all[a] = []
        food_by_all[a].append(ing)


result = {}
while len(food_by_all.keys()) > 0:
    allergenes = list(food_by_all.keys())
    for all in allergenes:
        candidates = intersect(food_by_all[all])
        if len(candidates) != 1:
            continue

        result[all] = candidates[0]
        del food_by_all[all]

        for foods in food_by_all.values():
            for food in foods:
                if candidates[0] in food:
                    food.remove(candidates[0])

total = 0
for food in ingredients_by_line:
    for ing in food:
        if ing not in result.values():
            total += 1
print("Result for part 1:", total)


part2 = []
for a in sorted(result.keys()):
    part2.append(result[a])
print("Result for part 2:", ','.join(part2))

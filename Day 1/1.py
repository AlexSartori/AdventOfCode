numbers = [int(l.strip()) for l in open('input').readlines()]
numbers.sort()

idx_1 = 0
idx_2 = len(numbers) - 1
sum = numbers[idx_1] + numbers[idx_2]

while sum != 2020:
    if sum < 2020:
        idx_1 += 1
    else:
        idx_2 -= 1

    sum = numbers[idx_1] + numbers[idx_2]


print("Numbers:")
n1, n2 = numbers[idx_1], numbers[idx_2]
print("  {} + {} = {}".format(n1, n2, n1+n2))
print("  {} * {} = {}".format(n1, n2, n1*n2))

numbers = [int(l.strip()) for l in open('input').readlines()]
numbers.sort()

idx_1 = 0
idx_2 = 1
idx_3 = len(numbers) - 1

def sum():
    return numbers[idx_1] + numbers[idx_2] + numbers[idx_3]

while sum() != 2020:
    if sum() < 2020:
        if idx_2 < idx_3 - 1:
            idx_2 += 1
        else:
            idx_1 += 1
            idx_2 = idx_1 + 1
            idx_3 = len(numbers) - 1
    else:  # sum > 2020
        if idx_3 > idx_2 + 1:
            idx_3 -= 1
        else:
            print("No solution can be found")
            exit(-1)

print("Numbers:")
n1, n2, n3 = numbers[idx_1], numbers[idx_2], numbers[idx_3]
print("  {} + {} + {} = {}".format(n1, n2, n3, n1+n2+n3))
print("  {} * {} * {} = {}".format(n1, n2, n3, n1*n2*n3))

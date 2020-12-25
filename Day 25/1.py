def loop_to(target):
    i, n = 1, 7
    while n != target:
        n *= 7
        n %= 20201227
        i += 1
    return i


def loop_for(subj, size):
    n = 1
    for i in range(size):
        n *= subj
        n %= 20201227
    return n


n1, n2 = map(int, open('input').readlines())
# n1, n2 = 5764801, 17807724
print(loop_for(n2, loop_to(n1)))

from functools import reduce


def china_theorem(a, b):
    if a[1] < b[1]:
        a, b = b, a
    gcd, x, y = euclide(a[1], b[1])
    k = (a[0] - b[0]) // gcd
    res = a[0] - k*x*a[1]
    mod = a[1] * b[1] // gcd
    return (res % mod, mod)


def euclide(a, b):
    if a == 0:
        return (b, 0, 1)
    else:
        gcd, x, y = euclide(b % a, a)
        return (gcd, y - (b // a) * x, x)


f = open('input')
_ = f.readline()
busses = f.readline().split(',')
eq_classes = [(int(b) - i, int(b)) for i, b in enumerate(busses) if b != 'x']
res = reduce(china_theorem, eq_classes)
print(res[0])

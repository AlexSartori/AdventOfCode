lines = [l.split(' = ') for l in open('input')]
mem = {}
mask = 'X'*36


def write_to_mem(addr, val):
    bin_str = "{:0>36b}".format(val)
    bin_str = ''.join(apply_mask(bin_str))
    mem[addr] = int(bin_str, 2)


def apply_mask(val):
    for v, m in zip(val, mask):
        yield v if m == 'X' else m


for i, val in lines:
    if i == 'mask':
        mask = val.strip()
    else:
        write_to_mem(i[4:-1], int(val))

print(sum(v for v in mem.values()))

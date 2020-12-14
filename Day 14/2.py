lines = [l.split(' = ') for l in open('input')]
mem = {}
mask = 'X'*36


def decode(addr, val):
    bin_addr = "{:0>36b}".format(addr)
    bin_addr = ''.join(apply_mask(bin_addr))
    write_to_mem(bin_addr, val)


def apply_mask(val):
    for v, m in zip(val, mask):
        yield v if m == '0' else m


def write_to_mem(bin_addr, val):
    if 'X' not in bin_addr:
        mem[int(bin_addr, 2)] = val
    else:
        idx = bin_addr.index('X')
        write_to_mem(bin_addr[:idx] + '0' + bin_addr[idx+1:], val)
        write_to_mem(bin_addr[:idx] + '1' + bin_addr[idx+1:], val)


for i, val in lines:
    if i == 'mask':
        mask = val.strip()
    else:
        decode(int(i[4:-1]), int(val))

print(sum(v for v in mem.values()))

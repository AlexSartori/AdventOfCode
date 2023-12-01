f = open('input')
earliest = int(f.readline())
busses = [int(b) for b in f.readline().split(',') if b != 'x']
res = min((b - (earliest % b), b) for b in busses)
print(res[0]*res[1])

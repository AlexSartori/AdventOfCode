fs = require('fs')

target = 257342611
nums = []
nums.push parseInt n for n in fs.readFileSync('input', 'utf8').split('\n')

print_res = (res) ->
    min = max = res[0]
    for n in res
        if n < min then min = n
        if n > max then max = n
    console.log min + max

for i in [0..nums.length]
    sum = 0
    offset = 0
    sum += nums[i+offset++] while sum < target
    if sum == target
        offset--
        print_res nums[i..i+offset]

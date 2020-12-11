fs = require('fs')

preamble_len = 25
nums = []
nums.push parseInt n for n in fs.readFileSync('input', 'utf8').split('\n')

is_valid_at = (idx) ->
    arr = nums[idx-preamble_len..idx]
    for n1 in arr
        for n2 in arr
            if n1 != n2 and n1 + n2 == nums[idx]
                return true
    false

for i in [preamble_len..nums.length]
    if not is_valid_at i
        console.log nums[i]

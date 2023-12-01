#!/bin/bash

diff1=0
diff3=0
curr_jolts=0

for line in $(sort -h input)
do
    diff=$(( $line - $curr_jolts ))
    echo "Curr jolts: " $curr_jolts
    echo "Line:       " $line
    echo "Diff:       " $diff
    echo ""
    curr_jolts=$line

    if [ $diff -eq 1 ]
    then
        (( diff1++ ))
    elif [ $diff -eq 3 ]
    then
        (( diff3++ ))
    fi
done

# Add last difference of 3 with final device
(( diff3++ ))

echo "Diff 1: " $diff1
echo "Diff 3: " $diff3
echo "Result: " $(($diff1 * $diff3))

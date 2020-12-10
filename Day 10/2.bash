#!/bin/bash

# Add 0 to the input
echo '0' >> input
input=( $(sort -h input) ) # Store as array
len=${#input[@]}
dynamic=(); # D[i] = combinations from $in[i]. Solution = D[0]

function get () {
    local idx=$1

    if [ -z ${dynamic[$idx]} ]
    then
        if [ $idx -eq $(( $len - 1 )) ]
        then
            dynamic[$idx]=1
        else
            local i=$(( $idx + 1 ))
            local max_jolts=$(( ${input[$idx]} + 3 ))
            local res=0

            while [ $i -lt $len ] && [ ${input[$i]} -le $max_jolts ]
            do
                get $i
                res=$(( $res + ${dynamic[$i]} ))
                (( i++ ))
            done

            dynamic[$idx]=$res
        fi
    fi
}

get 0
echo "D[0]: " ${dynamic[0]}

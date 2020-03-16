#!/usr/bin/env bash

# HackerRank - Linux Shell - Excercise 6
# Author: MTO (https://www.mto.nu)

declare -i X
declare -i Y

#echo -n "Enter X: "
read X
#echo -n "Enter Y: "
read Y


if [[ $X -lt $Y ]]; then
    echo "X is less than Y"
elif [[ $X -gt $Y ]]; then
    echo "X is greater than Y"
elif [[ $X -eq $Y ]]; then
    echo "X is equal to Y"
fi

#Much shorter Solution (&& if first statement is true then second statement)
[[ $X -gt $Y ]] && echo 'X is greater than Y'
[[ $X -eq $Y ]] && echo 'X is equal to Y'
[[ $X -lt $Y ]] && echo 'X is less than Y'
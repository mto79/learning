#!/usr/bin/env bash

#echo -n "Enter X: "
read X
#echo -n "Enter Y: "
read Y

check_constraint1() {
    if   [[ $1 -ge -100 ]] && [[ $1 -le 100 ]]; then 
        return 0
    else
        return 1
    fi
}

check_constraint2() {
    if ! [[ $1 -eq 0 ]]; then
        return 0
    else
        return 1
    fi
}

if ! check_constraint1 $X; then
    echo "X violates constraint1 X>=-100 and X<=100 "
elif ! check_constraint1 $Y; then
    echo "Y violates constraint1 Y>=-100 and Y<=100  "
elif ! check_constraint2 $Y; then 
    echo "Y violates constraint2 Y!=0"
else
    echo $(( X + Y ))
    echo $(( X - Y ))
    echo $(( X * Y ))
    echo $(( X / Y )) 
fi
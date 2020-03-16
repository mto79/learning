#!/usr/bin/env bash
#
# HackerRank - Linux Shell - Excercise 8 
# Author: MTO (https://www.mto.nu)
# Links: https://www.mathsisfun.com/triangle.html

declare -i X
declare -i Y
declare -i Z

#echo -n "Enter X: "
read X
#echo -n "Enter Y: "
read Y
#echo -n "Enter Z: "
read Z

check_constraint1() {
    if [[ $1 -ge 1 ]] && [[ $1 -le 1000 ]]; then 
        return 0
    else
        return 1
    fi
}

check_constraint2() {    
    local val1=$1
    local val2=$2
    local val3=$3

    #echo "$val1 $val2 $val3"

    if [[ $(( val1 + val2 )) -gt $val3 ]]; then
        return 0
    else
        return 1
    fi
}

if check_constraint1 $X && check_constraint1 $Y && check_constraint1 $Z; then
    #echo "1<=X,Y,Z<=1000"
    if check_constraint2 $X $Y $Z && check_constraint2 $X $Z $Y && check_constraint2 $Y $Z $X; then
        #echo "X+Y>Z, X+Z>Y and Y+Z>X"
        if [[ $X -eq $Y  && $Y -eq $Z ]]; then
            echo "EQUILATERAL" #Three equal sides 
        elif [[ $X -eq $Y || $X -eq $Z || $Y -eq $Z ]]; then
            echo "ISOSCELES" #Two equal sides
        else
            echo "SCALENE" #No equal sides
        fi
    fi
fi
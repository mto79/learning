#!/usr/bin/env bash
#
# HackerRank - Linux Shell - Excercise 7 
# Author: MTO (https://www.mto.nu)

#echo -n "Enter character: "
read inputchar 

declare -a validchars
validchars=("y" "Y" "n" "N")

foundchar=`echo ${validchars[*]} | grep "$inputchar"`

if [[ "${foundchar}" != "" ]]; then
    if [[ $inputchar == "n"  ]] || [[ $inputchar == "N" ]]; then
        echo "NO"
    elif [[ $inputchar == "y" ]] || [[ $inputchar == "Y" ]]; then
        echo "YES"
    fi
fi
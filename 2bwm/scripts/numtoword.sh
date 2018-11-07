#!/bin/bash
# Shell script to read a number and write the number in words. Use case
# control structure. For example 12 should be print as one two
# -------------------------------------------------------------------------
# Copyright (c) 2005 nixCraft project <http://cyberciti.biz/fb/>
# This script is licensed under GNU GPL version 2.0 or above
# -------------------------------------------------------------------------
# This script is part of nixCraft shell script collection (NSSC)
# Visit http://bash.cyberciti.biz/ for more information.
# -------------------------------------------------------------------------
 
n=$1 
len=$(echo $n | wc -c)
len=$(( $len - 1 ))
 
#echo "Your number $n in words : "
for (( i=1; i<=$len; i++ ))
do
   # get one digit at a time
    digit=$(echo $n | cut -c $i)
   # use case control structure to find digit equivalent in words 
    case $digit in
        0) echo -n "ten " ;;
        1) echo -n "one " ;;
        2) echo -n "two " ;;
        3) echo -n "three " ;;
        4) echo -n "four " ;;
        5) echo -n "five " ;;
        6) echo -n "six " ;;
        7) echo -n "seven " ;;
        8) echo -n "eight " ;;
        9) echo -n "nine " ;;
    esac 
done
 
# just print new line
echo ""

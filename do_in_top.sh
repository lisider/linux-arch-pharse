#########################################################################
# File Name: do.sh
# Author: Sues
# mail: sumory.kaka@foxmail.com
# Created Time: Tue 18 Jan 2022 10:37:58 AM CST
# Version : 1.0
#########################################################################
#!/bin/bash


cat arch/out2_function.txt | while read line
do
    number=`global -r $line | wc -l`
    if [  $number -gt 0 ];then
        echo $line >> arch/outA_function_used_by_outer.txt
    else
        :
    fi
done

cat arch/out2_macro.txt | while read line
do
    number=`global -r $line | wc -l`
    if [  $number -gt 0 ];then
        echo $line >> arch/outA_macro_used_by_outer.txt
    else
        :
    fi
done


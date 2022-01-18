#########################################################################
# File Name: do.sh
# Author: Sues
# mail: sumory.kaka@foxmail.com
# Created Time: Tue 18 Jan 2022 10:01:32 AM CST
# Version : 1.0
#########################################################################
#!/bin/bash


rm out1_macro.txt out1_function.txt -f
find . -name "*.c" -or -name "*.h" -or -name "*.S" | while read line
do
    echo $line
    #global -f $line >> out1.txt
    ctags -x $line |grep -w macro  | grep -v static >> out1_macro.txt
    ctags -x $line |grep -w function  | grep -v static >> out1_function.txt
done



rm out2_function.txt out2_macro.txt -f
cat out1_macro.txt | while read line
do
    echo $line | awk -F " " '{print $1}' >> out2_macro.txt
done
cat out1_function.txt | while read line
do
    echo $line | awk -F " " '{print $1}' >> out2_function.txt
done


#cat out2_macro.txt | while read line
#do
#    number=`global -r $line | wc -l`
#    if [  $number -gt 0 ];then
#        echo $line >> out3_macro_used_by_inner.txt
#    else
#        echo $line >> out3_macro_usedno_by_inner.txt
#    fi
#done
#
#cat out2_function.txt | while read line
#do
#    number=`global -r $line | wc -l`
#    if [  $number -gt 0 ];then
#        echo $line >> out3_function_used_by_inner.txt
#    else
#        echo $line >> out3_function_usedno_by_innner.txt
#    fi
#done

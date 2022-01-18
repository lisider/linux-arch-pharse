#########################################################################
# File Name: do-m.sh
# Author: Sues
# mail: sumory.kaka@foxmail.com
# Created Time: Tue 18 Jan 2022 11:21:29 AM CST
# Version : 1.0
#########################################################################
#!/bin/bash
cat  $1 | sort | uniq > all-func0.txt

let num=0

OBJ="map|phy|memory|page|mm|mem|vma|pgd|pud|pmd|pte|pfn"
OBJ_FILE=mem.txt
let num_next=num+1
cat  all-func${num}.txt  |grep -i -E $OBJ > $OBJ_FILE
cat  all-func${num}.txt  |grep -i -v -E ${OBJ} > all-func${num_next}.txt
let num=num+1

OBJ="cpu|idle|cache|interrupt|irq|abort"
OBJ_FILE=cpu.txt
let num_next=num+1
cat  all-func${num}.txt  |grep -i -E $OBJ > $OBJ_FILE
cat  all-func${num}.txt  |grep -i -v -E ${OBJ} > all-func${num_next}.txt
let num=num+1



echo all-func${num_next}.txt

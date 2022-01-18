#########################################################################
# File Name: do-m.sh
# Author: Sues
# mail: sumory.kaka@foxmail.com
# Created Time: Tue 18 Jan 2022 11:21:29 AM CST
# Version : 1.0
#########################################################################
#!/bin/bash
cat  $1 | sort | uniq  |grep  "^__NR" > syscall.txt
cat  $1 |sort | uniq   |grep  -v "^__NR" > all-macro1.txt

cat  all-macro1.txt  |grep  "^SIG" > signal.txt
cat  all-macro1.txt  |grep  -v "^SIG" > all-macro2.txt

cat  all-macro2.txt  |grep -i -E "atomic|cmp|xchg" > atomic.txt
cat  all-macro2.txt  |grep -i -v -E "atomic|cmp|xchg" > all-macro3.txt

cat  all-macro3.txt  |grep -i -E "pgd|pud|pmd|pte|page|virt|phy|pg|_mm|pa" > mem.txt
cat  all-macro3.txt  |grep -i -v -E "pgd|pud|pmd|pte|page|virt|phy|pg|_mm|pa" > all-macro4.txt

cat  all-macro4.txt  |grep -i -E "read|write|out|io|^in|bit" > io.txt
cat  all-macro4.txt  |grep -i -v -E "read|write|out|io|^in|bit" > all-macro5.txt

OBJ="cache|flush|cpu"
OBJ_FILE=cpu.txt
cat  all-macro5.txt  |grep -i -E $OBJ > $OBJ_FILE
cat  all-macro5.txt  |grep -i -v -E ${OBJ} > all-macro6.txt

cat  all-macro6.txt  |grep -i -E "irq" > irq.txt
cat  all-macro6.txt  |grep -i -v -E "irq" > all-macro7.txt

let num=7



OBJ="mb"
OBJ_FILE=mb.txt
let num_next=num+1
cat  all-macro${num}.txt  |grep -i -E $OBJ > $OBJ_FILE
cat  all-macro${num}.txt  |grep -i -v -E ${OBJ} > all-macro${num_next}.txt
let num=num+1


OBJ="bug|access|get_user|put_user|clear_user"
OBJ_FILE=bug.txt
let num_next=num+1
cat  all-macro${num}.txt  |grep -i -E $OBJ > $OBJ_FILE
cat  all-macro${num}.txt  |grep -i -v -E ${OBJ} > all-macro${num_next}.txt
let num=num+1




echo all-macro${num_next}.txt

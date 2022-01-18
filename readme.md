#### 这是做什么的
```c

用于 分析 linux arch 下的 函数 被 非 arch 目录调用情况的脚本

```


#### 环境配置
```c
gnu global 安装
ctags 安装

```


#### 执行顺序
```c
1.在 arch(此时arch下只有arm一个目录文件)目录下,执行 do_in_arch.sh
2.将 arch 目录移除,并执行 gtags,执行后将arch恢复
3.在 top 目录  执行 do_in_top.sh
4.在 arch目录  执行 ./pharse_function_out.sh outA_function_used_by_outer.txt 和 ./pharse_macro_out.sh  outA_macro_used_by_outer.txt


```

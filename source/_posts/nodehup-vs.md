---
title: nodehup-vs-&
date: 2022-09-04 18:40:58
tags: ["Bash", "Linux", "OS"]
categories: ["Linux"]
---
# nohup vs &
***
## 前言  

> nohup python test.py &
***
## 给进程传递信号 - "kill" not "kill"
在日常开发中,如果需要终止一个进程，可以使用kill 命令

```Bash
# usage of kill
kill – terminate or signal a process

# Terminate pid
kill pid
# 或
kill -9 pid
```

kill 指令的作用是 终结或者向一个进程发送信号  


- kill可以发送的信号有哪些  

| Number  | Name    | Meaning     |
| ------- | --------| ----------- |
| 1       | HUP     | Hangup,挂起<br> 前台进程收到该信号会terminate <br> daemon 进程收到该信号会重启并且重新加载配置文件|
| 2       | INIT    | Interrupt, 中断, ctrl+c 发送的就是该信号， 进程收到该信号会终止|
| 3       | QUIT    | quit        |
| 9       | KILL    | kill, 这个信号比较特别，不是发送到program的，内核收到该信号就会直接杀掉这个程序 |
| 15      | TERM    | terminate, kill指令默认发送的信号，程序响应,可以进行一些程序关闭前的处理工作 |
| 18      | CONT    | continue, 恢复被 STOP 的程序 |
| 19      | STOP    | stop, 让程序暂停而不是终结，这个信号也不是发往程序本身的，所有不能被忽略 |
| 20      | TSTP    | terminal stop. ctrl+z 发送该信号，程序自身接收该信号|

> nohup 启动的程序，忽略 HUP 信号，例如启动程序后,关闭terminal。

***
## 前台 后台

```Bash
python test.py
```
上面这个命令会在前台运行 test.py 脚本,前台运行的程序与终端生命周期是绑定的，如果在程序运行中，中断被关闭了，那么在这个终端上运行的前台程序都会终止。

Q: 如何将前台进程放到后台?
A: 在命令行末尾加上 &. 例如 `python test.py &`

Q: 如何查看当前终端放到后台的进程?
A: 使用 `jobs` 命令

Q: 如何将后台进程放到前台?
A: 使用 `fg`命令, 例如 `fg %1`, 1 是 `jobs` 查看的序号

Q: 如何将前台进程放到后台?
A: 使用 `bg`命令, 例如`bg %1`

## 总结

```Bash
nohup python test.py &
```
所以上述命令行的意思是，在后台运行 test.py 脚本，且该程序不响应 HUP 信号。
以此保证该程序不会因为终端关闭而停止。




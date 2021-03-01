awk '{print $1}' /var/log/httpd/access_log  //最简单的
awk '{print $1}END{print NR}' /var/log/httpd/access_log  //读取行数

添加数组
统计Web访问量排名
awk '{ip[$1]++} END{for(i in ip) {print ip[i],i }}' /var/log/httpd/access_log
根据访问量排名
awk  '{ip[$1]++} END{for(i in ip) {print i,ip[i]}}' /var/log/httpd/access_log | sort -nr


#!/bin/bash
while :
do
uptime | awk '{print "cpu的15分钟平均负载是"$NF}'
ifconfig eth0 | awk '/RX p/{print "eth0网卡的接收流量是"$5"字节"}'
free -h | awk '/^Mem/{print "剩余内存是"$4}'
df -h | awk '/\/$/{print "磁盘根分区剩余容量是"$4}'
awk 'END{print "账户总数是"NR"个"}' /etc/passwd
echo "当前开启的进程数量是$(ps aux | wc -l)个"
echo "当前登录的用户数量是$(who | wc -l)个"
echo "总共安装的软件包数量是$(rpm -qa | wc -l)个"
sleep 3			//休息3秒
clear 			//清屏
done


ps是Linux下用来查看进程的各种信息的工具，通过ps命令我们可以非常清楚地掌握各个进程所使用的系统资源，
及时发现那些资源消耗异常的进程。保障服务器系统的高可用性及稳定性。
ps命令选项：

简单进程选择：

-A      选择所有进程
-e      选择所有进程，等同于-A

输出格式控制：

-l —— 长格式，-y选项和这个一起用时很有用
-o —— 自定义输出格式，后接格式说明符，（格式说明符间用逗号隔开）
-y —— 不显示flags，显示rss来代替addr，这个选项只能和-l选项一起用
rss RSS 物理内存的使用大小（单位为KB） 
输出修改器（OUTPUT MODIFIERS）：

--no-headers —— 不打印头部
--sort spec  —— 指定排序次序，默认是按spec（说明符）升序排列（+spec：按spec升序排列；-spec，按spec降序排列）


#!/bin/bash

# 网络接口名称
INTERFACE="eth0"

# 添加IP的起始地址和结束地址
START_IP=2
END_IP=30

# 子网前缀
SUBNET="1.1.1."
PREFIX="/27"

# 使用for循环批量添加IP
for i in $(seq $START_IP $END_IP); do
  IP="${SUBNET}${i}${PREFIX}"
  echo "Adding IP: $IP"
  nmcli connection modify $INTERFACE +ipv4.addresses $IP
done

# 重启网络接口
nmcli connection down $INTERFACE && nmcli connection up $INTERFACE


---
title: VPS 配置 SSH KEY 免密码+安全
date: 2020-05-04T13:55:27+08:00
draft: false
tags: ["ssh"]
series: ["vps"]
categories: ["linux"]
---

# VPS 配置 SSH KEY 免密码+安全
<!--more-->

## 原理和作用
利用密钥生成器制作一对密钥 —— 公钥和私钥。 
将公钥添加到服务器的某个账户上，然后在客户端利用私钥即可完成认证并登录。  
这样一来，没有私钥，任何人都无法通过 SSH 暴力破解你的密码来远程登录到
系统。
此外，如果将公钥复制到其他账户甚至主机，利用私钥也可以登录。  

## 生成 SSH 密钥对

1. 生成密钥可以在远端 VPS 上，也可以在本地终端上进行操作，方法都是类似的。
输入命令 `ssh-keygen` 然后按 4 次 Enter 键就行了。

2. 在~./ssh下会生成`id_rsa.pub`和`id_rsa`两个文件，分别是公钥和私钥。

##  安装公钥:
- 服务器端生成的公钥
```
cd .ssh/
cat id_rsa.pub >> authorized_keys # 将公钥写入到 authorized_keys
chmod 600 authorized_keys # 修改读写属性
chmod 700 ~/.ssh # 修改读写属性
```
- linux本地生成的公钥
`ssh-copy-id 1 user@remote -p port`
其中user 为用户名， remote 为IP地址， port为端口号。
- windows本地生成的公钥
```
ssh user@remote -p port 'mkdir -p .ssh && cat >> .ssh/authorized
```
命令的含义是，在远端新建 .ssh 文件夹，并把本地的 ~/.ssh/id_rsa.pub（公钥）追加到远端
的 .ssh/authorized_keys 中。

## 修改ssh配置文件

```
# nano /etc/ssh/sshd_config，修改以下为yes
RSAAuthentication yes
PubkeyAuthentication yes

# 重启服务
service sshd restart
```

## 本地配置
- Putty，MobaXterm等软件中设置刚才生成的私钥。

## 禁止密码登录
```
# nano /etc/ssh/sshd_config
PasswordAuthentication no # 禁用密码登录，务必在私钥登录成功后设置。
```

## VPS之间利用ssh登录
- 主要用来管理ping很差的vps
- 私钥上传到登录服务器上，对应公钥在被登录服务器上，然后执行：
```ssh ip -p 6799 #``` 

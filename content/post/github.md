---
title: Github备份
date: 2020-05-02T23:55:27+08:00
draft: false
tags: ["github"]
series: ["syn"]
categories: ["Programming"]
---

# Github备份blog
<!--more-->
## 安装
```
Github网站：
同时登陆github，添加ssh后，执行
ssh -T git@github.com
增加repositories

VPS上：
apt install git
cd DIR
git init
git config user.name "haelking"
git config user.email "xxx.@xxx.com
git remote add origin https://github.com/haelking/hkblog.git

如果出现错误：fatal: remote origin already exists，则执行以下语句：
git remote rm origin
git push -u origin master
如果出现错误，则
git pull origin master
## push
cd /var/www/hkblog

git add .
git commit -m "all"
git push -u origin master # 第一次加-u后，后续可以使用git push
也可以把上述三个语句写入push.sh中执行，要chmod +x push.sh
```
## ssh错误
```
ssh -T git@github.com
如果连不上，或者执行出错
1. 检查端口22是否开放
2. '~/' 目录内添加用户
git config --global user.email “william.lian.fang@gmail.com”
git config --global user.name “williamlfang”
3. 使用443端口，在~/.ssh/config，添加:
Host github.com
  Hostname ssh.github.com
  Port 443
然后执行: 
ssh -T -p 443 git@ssh.github.com
如果存在权限问题，执行:  
chmod 700 ~/.ssh/id_rsa
如果还有问题 '~/hkblog/.git/config'修改https地址为ssh地址:
# 修改前
[remote "origin"]
	url = https://github.com/ganchaoyang/git-test.git
	fetch = +refs/heads/*:refs/remotes/origin/*

# 修改后
[remote "origin"]
	url = git@github.com:ganchaoyang/git-test.git
	fetch = +refs/heads/*:refs/remotes/origin/*
```

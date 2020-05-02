---
title: Github
date: 2020-05-2T23:55:27+08:00
draft: false
tags: ["github"]
series: ["syn"]
categories: ["Programming"]
---

# Github基本操作
## 安装
```
Github网站：
同时登陆github，添加ssh
增加repositories

VPS上：
apt install git
git config user.name "haelking"
git config user.email "xxx.@xxx.com
git remote add origin https://github.com/haelking/hkblog.git

如果出现错误：fatal: remote origin already exists，则执行以下语句：
git remote rm origin
git push origin master
如果出现错误，则
git pull origin master
## push
cd /var/www/hkblog
git add .
git commit -m "all"
git push 

```

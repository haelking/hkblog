---
title: hugo安装
date: 2020-04-30T23:55:27+08:00
draft: false
tags: ["hugo"]
series: ["Editor"]
categories: ["Hugo"]
---

# 做个懒笔记
<!--more-->

# blog的VPS

![webhook](/img/webhook.png)  
![webhook-2](/img/webhook-2.png)  

## 安装hugo最新版
https://github.com/gohugoio/hugo/releases
sudo dpkg -i *.deb
如果出错
执行
sudo apt install -f

## 安装git
apt install git

## 配置caddy

```
安装caddy 要带上http.git
nano /etc/caddy/Caddy 
增加以下内容：
hkblog.201682.xyz
{
        gzip
        root /var/www/hkblog/public
        tls hael.wang@gmail.com
#       log ./blog.log
#       errors ./blog-errors.log

         # caddy 的 http.git 插件
        git {
        repo https://github.com/haelking/hkblog.git
        branch master
        path /var/www/hkblog/
        clone_args --recursive
        pull_args --recurse-submodules
        key /var/www/.ssh/id_rsa
        hook /webhook labatkuji
        then hugo --source=/var/www/hkblog/ --destination=/var/www/hkblog/public
        hook_type github
        interval 600
        }
}
```
当然事先要把域名指向VPS的IP
然后重启caddy服务器
同时要把blog的文件夹更改用户为www-data
```
chown www-data:www-data /var/www/xxx.com
```

## 建立网站
hugo new site /var/www/hkblog
cd /var/www/hkblog

# 本地
## 安装hugo和git同vps

## 建立两个帖子试试
```
hugo new about.md

nano content/about.md

增加内容如下：
---
title: "About"
date: 2019-09-10T06:57:08Z
draft: false
---

hugo new post/first.md
nano content/post/first.md

增加内容如下：

---
title: "First"
date: 2019-09-10T06:58:51Z
draft: false
---

## This is my first blog post

Hi How are you!

I am hitesh jethva working as a technical writer.
```

## 安装主题
```
cd themes
cd themes
git clone https://github.com/g1eny0ung/hugo-theme-dream.git dream
cat hugo-strata-theme/exampleSite/config.toml > ../config.toml
```
### 配置主题
1. config.toml
```
nano ../config.toml

baseurl = "/"

 [[menu.main]]
  name = "About"
  url  = "about"
  weight = 5
  theme = "dream"
```
2. index.html layout
```
nano /root/test.example.com/layouts/index.html

{{ define "main" }}
        {{ if not .Site.Params.about.hide }}
                {{ partial "about" . }}
        {{ end }}

        {{ if not .Site.Params.portfolio.hide }}
                {{ partial "portfolio" . }}
        {{ end }}

        {{ if not .Site.Params.recentposts.hide }}
                {{ partial "recent-posts" . }}
        {{ end }}

        {{ if not .Site.Params.contact.hide }}
                {{ partial "contact" . }}
        {{ end }}
{{ end }}
```
## 生成网站
```
cd ~/hkblog
hugo
```


[^1]:部分内容引用，感谢。https://www.howtoforge.com/how-to-install-hugo-site-generator-on-ubuntu/

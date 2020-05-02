---
title: hugo安装
date: 2020-04-30T23:55:27+08:00
draft: false
tags: ["hugo"]
series: ["Editor"]
categories: ["Hugo"]
---
# 做个记录
<!--more-->
https://github.com/gohugoio/hugo/releases
下载最新版本
sudo dpkg -i *.deb
如果出错
执行
sudo apt install -f

再安装 git
apt install git

hugo new site test.example.com
cd test.example.com
 hugo new about.md

nano content/about.md

增加：
---
title: "About"
date: 2019-09-10T06:57:08Z
draft: false
---


hugo new post/first.md
nano content/post/first.md
增加：

---
title: "First"
date: 2019-09-10T06:58:51Z
draft: false
---

## This is my first blog post

Hi How are you!


I am hitesh jethva working as a technical writer.


cd themes
wget https://github.com/digitalcraftsman/hugo-strata-theme/archive/master.zip
unzip master.zip
cat hugo-strata-theme/exampleSite/config.toml > ../config.toml

nano ../config.toml

baseurl = "/"

 [[menu.main]]
  name = "About"
  url  = "about"
  weight = 5

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


cd ../test.example.com
 hugo

/etc/caddy/Caddy 文件里增加xxx.com配置I注意路径是public文件夹)

一定要
chown www-data:www-data /var/www/xxx.com

https://www.howtoforge.com/how-to-install-hugo-site-generator-on-ubuntu/

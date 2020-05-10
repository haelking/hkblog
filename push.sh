## 保存当前目录
echo "Start to publish...\n"
## 切换到项目目录
cd /home/hael/hkblog/
# 执行git命令
git add .
git commit -m "all"
git push
# 切换回原来的目录
# 删除缓存 
echo "Success...\n"

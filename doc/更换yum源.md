更换yum源
====

#### 阿里云yum源：
1. 备份当前yum源防止出现意外还可以还原回来
```
cd /etc/yum.repos.d/
cp /CentOS-Base.repo /CentOS-Base-repo.bak
```

2. 使用wget下载阿里yum源repo文件
```
wget http://mirrors.aliyun.com/repo/Centos-7.repo
```

3. 清理旧包
```
yum clean all
```

4. 把下载下来阿里云repo文件设置成为默认源
```
mv Centos-7.repo CentOS-Base.repo
```

5. 生成阿里云yum源缓存并更新yum源
```
yum makecache
yum update
```

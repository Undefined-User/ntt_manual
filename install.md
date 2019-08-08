# 部署

目前仅在 Centos 7 上成功编译运行，其他系统暂未测试。

{% hint style="warning" %}
当然，你可以自主部署项目。但仍需强调的是不建议这么做。目前项目处在快速功能迭代的阶段，可能会有更新兼容性问题。 \)
{% endhint %}

## Centos 7

### 下载

```bash
git clone https://kurumi.io/HiedaNaKan/NTTools /usr/local/ntt

cd /usr/local/ntt
```

### HOSTS 用于网易云音乐下载

```
158.69.209.100 music.163.com
14.215.100.225 m1.music.126.net
14.215.100.225 m2.music.126.net
14.215.100.225 m3.music.126.net
14.215.100.225 m4.music.126.net
14.215.100.225 m5.music.126.net
14.215.100.225 m6.music.126.net
14.215.100.225 m7.music.126.net
14.215.100.225 m8.music.126.net
14.215.100.225 m9.music.126.net
14.215.100.225 m10.music.126.net
```

### 安装 epel 源

```bash
yum install -y epel-release
```

### 证书

```bash
vim /etc/profile
```

```bash
export CF_Email="<Cloudflare Email>"
export CF_Key="<Cloudflare ApiKey>"
```

```bash
curl https://get.acme.sh | sh

acme.sh  --upgrade  --auto-upgrade

# 改为你的域名

acme.sh --issue --dns dns_cf -d kurumi.io *.kurumi.io

acme.sh  --installcert  -d kurumi.io   \
        --key-file   /etc/nginx/ssl/kurumi.io.key \
        --fullchain-file /etc/nginx/ssl/fullchain.cer \
        --reloadcmd  "service nginx force-reload"
```

### 配置Nginx

```bash
yum install -y nginx

/bin/cp -rf ntt.conf /etc/nginx/conf.d/ntt.conf

# 配置好证书

service nginx restart
```

### 安装 Git 与 OpenJDK8

```bash
yum install -y git java java-devel
```

### 安装字体

```bash

yum groupinstall "fonts" -y

yum install -y unzip mkfontscale fontconfig

cd /usr/share/fonts && mkdir noto-cjk && wget https://noto-website-2.storage.googleapis.com/pkgs/NotoSansCJKsc-hinted.zip && unzip Noto-unhinted.zip -d noto-cjk && rm -rf Noto-unhinted.zip

mkfontscale && mkfontdir && fc-cache -fv && source /etc/profile

```

### 安装 FFMpeg

```bash
rpm -v --import http://li.nux.ro/download/nux/RPM-GPG-KEY-nux.ro
rpm -Uvh http://li.nux.ro/download/nux/dextop/el7/x86_64/nux-dextop-release-0-5.el7.nux.noarch.rpm

yum install -y ffmpeg ffmpeg-devel
```

### 安装 MongoDB

```bash
vim /etc/yum.repos.d/mongodb-org-4.0.repo
```

```text
[mongodb-org-4.0]
name=MongoDB Repository
baseurl=https://repo.mongodb.org/yum/redhat/$releasever/mongodb-org/4.0/x86_64/
gpgcheck=1
enabled=1
gpgkey=https://www.mongodb.org/static/pgp/server-4.0.asc
```

```bash
yum install -y mongodb-org
```

### 从备份还原

```bash
# 将NTT导出的备份ZIP文件放置于数据目录下

cd /etc/ntt

unzip data.zip

mongorestore -d NTTools ./db/NTTools

rm -rf db data.zip
```

### 配置文件

将配置文件模板 settings.template.json 复制一份到 **/etc/ntt** 并改名为 settings.json 。

| 配置项 | 类型 | 说明 | 默认值 |
| :----: | :----: | :----: | :----: |
| db_address | 字符串 | MongoDB 地址 | 127.0.0.1 |
| db_port | 整型 | MongoDB 端口 | 27017 |
| service_name | 字符串 | 配置的服务名称 | ntt |
| cache_path | 字符串 | 缓存文件存放地址 | /var/cache/ntt |
| use_unix_socket | 布尔值 | 使用 Unix Domain Socket | true |
| uds_path | 字符串 | Unix Domain Socket 文件地址 | /var/run/ntt.sock |
| local_port | 整型 | Http 服务器端口 | 65535 |
| server_domain | 字符串 | WebHook 域名 | 你的域名 |
| debug_mode | 布尔值 | 调试模式 | false |
| bot_token | 字符串 | 登录秘钥 | 你的Token |
| alias | 字符串数组 | 附加的BOT | [] |
| admins | 整型数组 | 管理员ID列表 | [] |
| log_channel | 字符串 | 日志频道 | 你的频道ID |
| tep_channel | 字符串 | 推友消失推送频道 | 你的频道ID |
| help_message | 字符串 | 帮助消息 | https://manual.kurumi.io |

关于 **Unix Domain Socket** : linux下延迟更短的连接方式，默认使用。

如果需要使用Http服务器模式，请修改 use_unix_socket 为 false , local_port 为 服务器端口， ntt.conf (Nginx 配置文件)

关于 **日志频道** : 用于输出错误日志

只要是能发送消息的聊天都可以，不限定必须是频道。

### 配置服务

```bash
/bin/cp -rf ntt.service /etc/systemd/system/ntt.service

#重载系统服务

systemctl daemon-reload

# 开机启动

systemctl enable ntt

# 更新并立即滚动日志

service ntt stop && cd /usr/local/ntt && bash update.sh && service ntt start && journalctl -u ntt.service -f
```

### 自动更新

设置Github Webhook 到 [https://你的域名/upgrade/你的BotToken](https://你的域名/upgrade/你的BotToken)


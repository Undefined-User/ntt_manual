# Twitter 相关

## 认证账号

### 普通认证

```text
/login
```

在Twitter授权页得到七位验证码，返回填写即可。

### ~~自定义来源~~

与普通认证的区别 : 使用NTT发送 / 回复推文时不显示来源为 NTT。

Twitter for Android : `/login android`

Twitter for iPhone : `/login iphone`

Twitter Web App : `/login web_app`

Twitter Web App : `/login web_client`

Twitter for 猫 : `/login cat`

( 感谢 [@Overflow Cat](https://github.com/OverflowCat) 提供)

Twidere for Android : `/login twidere`

### 自定义 API

```text
/login <consumer_key> <consumer_secret>
```

使用自定义API登录 ，这需要在 [https://developer.twitter.com/](https://developer.twitter.com/) 创建。

注意 : 虽然 API 权限为只读也能工作，但是不能使用某些功能。

### 自定义 TOKEN

```text
/login <consumer_key> <consumer_secret> <access_token> <access_secret>
```

使用NTT导出的认证信息 或 Twitter开发者后台生成的Token 登录

### 导出认证

```text
/auth
```

可以用于其他程序或NTT高级登录

### 监听设置

```text
/track
```

关注者监听 : 当有新关注者和失去关注者时通知你，并提示该账号的风险 : 例如锁推、关注者低、没发过推文等等...

账号更改监听 : 可以对关注者或关注中选择开启，当对方账号冻结、解冻、个人信息\(头像、名称等\) 改动时通知你。

**对监听消息可以使用快速操作**

隐藏账号更改 : 对BOT其他用户隐藏自己的账号更改。

### 自动设置

```text
/auto
```

关注新关注者 : 当有一个用户关注你时，自动关注对方。

隐藏新关注的人的转推 : 当你新关注了一个用户，自动设置为隐藏转推。

### 快速操作

参数 : 用户可以为 用户ID/用户名/链接/回复通知消息/回复推文

`/follow <用户>` : 关注用户  
`/unfo <用户>` : 取消关注  
`/twuf <用户>` : 双向取关  
`/mute <用户>` : 静音用户  
`/unmute <用户>` : 取消静音  
`/mute_rt <用户>` : 隐藏转推  
`/unmute_rt <用户>` : 取消隐藏转推  
`/block <用户>` : 屏蔽用户  
`/unblock <用户>` : 取消屏蔽

### 发送推文

```text
/update <引用推文>
```

引用推文 \(可选\) : 直接对收到的推文消息回复。

然后发送内容即可，支持多图、视频、贴纸、动图。

使用 `/submit`  
使用 `/timed <时间>` 保存为定时推文

### 回复推文

直接对收到的消息回复任意内容即可，与发送推文用法相同。

### 接收推文

```text
/mention <on/off>
```

接收对自己的回复/转推评论

```text
/timeline <on/off>
```

接收时间线上的所有推文

### 推文存档

```text
/status <推文ID/链接>
```

将推文存档并显示、如果推文还存在则可以快速操作、直接回复。

### 推文拉取

```text
/fetch <用户ID/用户名/链接> <--all>
```

拉取用户所有推文 如果不带 --all 参数则如果拉取中 检测到 连续五条 存在存档的推文 则停止。

### 推文搜索

```text
/search <参数...> <文本>
```

from=\[用户ID...\] : 筛选发推用户  
to=\[用户ID...\] : 筛选对用户的回复  
reply=\[推文ID\] : 筛选对推文的回复

start=\[年-月-日/小时:分钟\] : 筛选指定时间后的推文  
end=\[...\] : 筛选指定时间前的推文  
utc=8 : 设置时间的时差 默认北京时间

regex : 启用正则表达式查询

media=true : 筛选有媒体的推文  
media=false : 筛选仅文本推文

例子 :

```text
/search from=@TwitterDev media=false test
```

### 视频下载

```text
/media <推文ID/链接>
```

BOT会回复所有可用 视频或GIF 的下载链接

### 列表导出

```text
/export
```

支持选择关注中、关注者、屏蔽、静音、隐藏转推列表与任何用户创建的列表。

### 推文删除

```text
/delete
```

使用 tweet.js / like.js 删除所有推文 / 喜欢

需要在 Twitter - 设置 - 账号 - 我的Twitter数据 导出个人数据。当导出完成时 将会收到邮件，点击右键里的链接即可下载压缩包。

在压缩包里找到 tweet.js / like.js 发送给BOT即可。

也可以选择直接拉取删除 \(无法拉取到个人主页看不到的推文\)

### TODO

* 推文定时删除


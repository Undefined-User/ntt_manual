# RSS 订阅

注意 : 如果非NTT本体，而是使用BOT创建功能托管的其他BOT，命令没有 rss_ 前缀。

### 订阅 RSS

```text
/rss_sub <频道> <RSS链接>
```

注意 : 频道可以为公开频道的用户名 (带不带@都可以)，也可以为频道ID。

私有频道查看ID : 将 NTT本体 邀请进频道，并发送 /id ，BOT会回复ID。

### 查看 所有订阅

```text
/rss_list <频道>
```

### 取消 订阅

```text
/rss_unsub <频道> <链接>
```

### 取消 所有订阅

```text
/rss_unsub_all
```

### 导入订阅

```text
/rss_import
```

支持 opml_1.0 与 opml_2.0

### 导出订阅

```text
/rss_export <频道>
```

### 设置 拉取间隔

```text
/rss_set_delay <分> <时> <天>
```

最少 15 分钟 ，最多 7 天。

例子 : `/rss_set_delay @myRssChannel 40` ( RssHub 缓存时间为40分钟，设置频道 40分钟拉取一次。)

### 设置 输出格式

RSS现在支持更多模式 :

使用 /rss_set_format <频道ID/用户名> ID

```text

1 : 

[文章标题](文章链接)

2 : 

**来源**

[文章标题](文章链接)

3 :

**来源**

[文章标题](文章链接)

简介...

4.

**标题**

简介...

链接

5.

**标题**

简介

来自 [作者 如果存在 - ] [来源](文章链接)

6.

**标题**

全文

7.

**标题**

全文

链接

8.

**标题**

全文

来自 [作者 如果存在 - ] [来源](文章链接)

9.

**来源**

[文章标题](生成的Telegraph预览文章)

10.

[文章标题](生成的Telegraph预览文章)

11.

**来源**

文章标题 | [Telegraph](生成的Telegraph预览文章) | [原文](文章链接)

12.

文章标题 | [Telegraph](生成的Telegraph预览文章) | [原文](文章链接)

```

注意 : 非 Telegraph 模式 所有图片会被转码成 a标签 指向图片地址。

另外 : Telegraph 模式下 底部会添加 "由 NTT 制作" 的字样，可以更改。

### 更改版权

```text
/rss_set_copyright <频道> <文本...>
```

更改 Telegraph 模式下底部的 "由 NTT 制作" 为自定义文本

如果文本为空，则重置回默认内容。

### 链接 预览

```text
/rss_link_preview <频道> <on/off>
```

开关链接预览 注意 : Telegraph 模式下强制开启链接预览。

### 更换输出BOT

```text
/rss_set_current
```

如果使用NTT本体订阅了RSS，想更换为自定义BOT，则将自定义BOT添加为频道管理，使用 `/set_current` ，重置为 NTT本体 则使用 `/rss_rss_current`
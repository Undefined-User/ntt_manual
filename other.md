# 杂项

## 身份证相关

### 检查是否有效

```
/ic_check <15/18位身份证>
```

{% hint style="success" %}
会检查地区是否有效，并给出提示。
{% endhint %}

### 生成校验位

```
/ic_18 <前17位身份证>
```

根据ISO 7064:1983.MOD 11-2，使用前十七位计算最后一位。

### 身份证生成

```
/ic_gen
```

随机生成格式正确的身份证号码，一次十条。

{% hint style="success" %}
支持指定目标地区 (省 市 乡)
{% endhint %}

## 发送链接按钮

格式 : 

```
@NTT_X_BOT BUTTONS

文本...

[第一行第一个按钮](链接) [第二个按钮](链接)
[第二行](链接)
```

## 发送HTML

注意 : Telegram 仅支持 a、b、i、pre、code、em 六个标签

格式 : 

```text
@NTT_X_BOT HTML 

内容...
```

## 简中转满洲语

注意 : 没有仔细研究、翻译接口为抓取的Cndic的接口、转换代码来自 [OverflowCat/ManchuBot](https://github.com/OverflowCat/ManchuBot/blob/master/Manchurize.gs)

格式 : 

```
@NTT_X_BOT M

内容...
```
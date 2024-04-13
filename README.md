# ChnqooRickshowMobile

## 环境

目前打包没法从`.env`里面读取环境变量，所以只能从命令行中加参数，

### Development

```java
flutter run --dart-define APP_PACKAGE_NAME=net.cctv3.rickshow.dev --dart-define APP_NAME=RickshowDev -v
```

### Staging

```java
flutter run --dart-define APP_PACKAGE_NAME=net.cctv3.rickshow.sit --dart-define APP_NAME=RickshowSit -v
```

### Alpha

```java
flutter run --dart-define APP_PACKAGE_NAME=net.cctv3.rickshow.uat --dart-define APP_NAME=RickshowUat -v
```

```java
flutter build apk --release --dart-define APP_PACKAGE_NAME=net.cctv3.rickshow.uat --dart-define APP_NAME=RickshowUat -v
```

### Production

```java
flutter build apk --release --dart-define APP_PACKAGE_NAME=net.cctv3.rickshow --dart-define APP_NAME=RickshowPro -v
```

理论上所有的变量都可以加在环境变量里面，这样儿就会导致构建命令过长，而且不易于维护，所以构建命令只包含了两个关键的参数，其余的配置从`.env.?`来读取 ...

读取`.env`的逻辑，来源于`{包名: env文件名}`的映射，

```dart
await ScreenUtil.ensureScreenSize();
String env = Config.useConfigDotenvFile(Config.APP_PACKAGE_NAME);
await dotenv.load(fileName: env);
```

```dart
static String useConfigDotenvFile(String package) {
  const map = {
    'net.cctv3.rickshow': ".env.production",
    "net.cctv3.rickshow.uat": ".env.alpha",
    "net.cctv3.rickshow.sit": ".env.staging",
    "net.cctv3.rickshow.dev": ".env.development"
  };
  return map[package]!;
}
```

### Web

网络图片跨域不显示，需要加参数`--web-browser-flag "--disable-web-security"`

### Json .g.dart creator

flutter pub run build_runner build

## 接口

### 接口安全

基本的`t`/`s` -> `MD5`键值对

- 前端：时间戳`t`和特定规则对`t`加密的`s`

- 后端：时间戳`t`和服务器时间 `<10s`，符合`MD5`的规则

```bash
curl --location 'http://192.168.0.104:21981/sendSms.do?mobile=15552198996'
--header 't: 1709672743504' --header 's: e7bc7ce3f287eb2c05e732c21d106a55'
```

## Thanks

- Material Design 3 -> https://www.fluttericon.cn/
- UI Notes -> https://uinotes.com/

https://www.iconfont.cn/collections/detail?spm=a313x.collections_index.i1.d9df05512.4a5f3a81aCIsa0&cid=48002
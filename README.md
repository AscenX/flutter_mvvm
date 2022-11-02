# flutter_mvvm



Flutter MVVM 架构，使用 rxdart, rx_command, dio 来实现



网络层 lib/module/common/netowrk

- `network_client` 用于网络请求，封装dio，返回一个stream
- `env_manager` 用于管理host，切换host
- `base_api` api抽象类，每一个请求都是基于一个api，包含 path, method, params, headers
- `api_request` 用于api发送请求



用法

```dart
IndexAPI.fetchIndexData().request()
```

返回的是一个Stream

一般结合`RxCommand`使用，详见`index_view_model`

```dart
RxCommand.createAsync((param) {
      page = (param as int) == 1 ? 1 : page + 1;
      Map<String, dynamic> params = {'page': page, 'pageSize': 20};
      return IndexAPI.listRequest(params).mockRequest().map((event) {
        // 解析数据
        
        return dataList;

      }).doOnData((event) {
        // 可以赋值给viewModel的数据源
        if (page == 1) {
          dataSource = [];
        }
        dataSource += event;
      }).first;
  });
}
```



每一个Command就是一个事件，一个请求，可以结合`FutureBuilder`或者`StreamBuilder`来绑定数据

```dart
FutureBuilder(
            future: vm.detailRequestCmd.first,
            builder: (ctx, snapShot) {
    // 可以通过 snapShot.data 来获取command的数据
		return widget;
})
```



#### 全局状态管理 Redux

详见 [Redux中文官网](https://cn.redux.js.org/introduction/getting-started)

用于管理全局的状态，是否登录，用户信息等

```dart
StoreBuilder(builder: (context, store){
	//获取store , return Widget;
  return buildContainer(store);
})
```



#### 全局广播通知 EventBus

```
EventBus().emit('ChangeLanguage');
```

```
EventBus().on('ChangeLanguage', (arg) {
  setState(() {});
});
```



#### TableView

在Flutter中为ListView，由于常用的像在iOS中的TableView，封装了一个，添加了下拉刷新和上拉加载，使用的是[easy_refresh](https://github.com/xuelongqy/flutter_easy_refresh，用法详见`IndexRoute`



### 多语言



使用的是 `intl`库，结合Android Studio的插件 `Flutter Intl`使用，非常方便

首先如果没初始化可以 `Tools > Flutter Intl > Initialize for the Project`，就会生成`lib/l10n/intl_en.arb`

格式就是json格式

```json
{
  "currentLang" : "English",
  "switch_lang" : "Switch Language",
}
```



然后保存即可生成 `lib/generated/`文件夹，之后每一次编辑都保存即可，会自动更新`lib/generated/`的内容



- 使用

```dart
import 'package:flutter_mvvm/generated/l10n.dart';

// 获取值

S.current.currentLang
```



- 切换语言

```dart
S.delegate.load(const Locale('en'));
```



需要在`main.dart`添加一个监听，然后`setState`即可，我使用的是 [EventBus](https://book.flutterchina.club/chapter8/eventbus.html)





#### 启动配置



在`Config.dart`里添加了



```dart
class Config {
  static const channel = String.fromEnvironment('CHANNEL', defaultValue: 'default');
}
```



用命令行运行

```shell
flutter run --dart-define=CHANNEL=testchannel
```



在`Android Studio`选择 `Edit Configurations` 中的 `Additional run args` 添加 

```
--dart-define=CHANNEL=testchannel
```

同样效果


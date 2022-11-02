import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mvvm/module/common/EventBus.dart';
import 'package:flutter_mvvm/module/common/redux/app_reducer.dart';
import 'package:flutter_mvvm/module/common/redux/app_state.dart';
import 'package:flutter_mvvm/module/ui/user/user_route.dart';
import 'package:flutter_mvvm/module/ui/index/index_route.dart';
import 'package:flutter_mvvm/module/ui/intl/intl_route.dart';
import './module/common/extension/color_ext.dart';
import 'package:flutter_mvvm/generated/l10n.dart';

void main() {
  runApp(const MyApp());
}

class _MyAppState extends State<MyApp> {
  int _currentIdx = 0;

  @override
  void initState() {
    super.initState();

    EventBus().on('ChangeLanguage', (arg) {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget home = Scaffold(
        appBar: const CupertinoNavigationBar(
          middle: Text('Flutter MVVM'),
        ),
        bottomNavigationBar: CupertinoTabBar(
          currentIndex: _currentIdx,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.list_rounded), label: 'List'),
            BottomNavigationBarItem(icon: Icon(Icons.language), label: 'Intl'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'User')
          ],
          onTap: (idx) {
            _currentIdx = idx;
            setState(() {});
          },
        ),
        body: IndexedStack(
            index: _currentIdx,
            children: [IndexRoute(), IntlRoute(), UserRoute()]));

    Widget app = MaterialApp(
        title: 'Flutter MVVM',
        localizationsDelegates: const [
          S.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: home);

    return app;
  }
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<StatefulWidget> createState() => _MyAppState();
}

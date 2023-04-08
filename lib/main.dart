import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mvvm/config/config.dart';
import 'package:flutter_mvvm/module/common/EventBus.dart';
import 'package:flutter_mvvm/module/common/redux/app_reducer.dart';
import 'package:flutter_mvvm/module/common/redux/app_state.dart';
import 'package:flutter_mvvm/module/pages/user/user_page.dart';
import 'package:flutter_mvvm/module/pages/index/index_page.dart';
import 'package:flutter_mvvm/module/pages/intl/intl_page.dart';
import 'package:flutter_mvvm/module/pages/video/video_page.dart';
import 'package:flutter_mvvm/generated/l10n.dart';

void main() {
  print('current channel:${Config.channel}');
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
            BottomNavigationBarItem(icon: Icon(Icons.video_camera_front), label: 'Video'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'User')
          ],
          onTap: (idx) {
            _currentIdx = idx;
            setState(() {});
          },
        ),
        body: IndexedStack(
            index: _currentIdx,
            children: [IndexPage(), IntlPage(), VideoPage(), UserPage()]));

    Widget app = MaterialApp(
        title: 'Flutter MVVM',
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
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

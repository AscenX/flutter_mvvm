import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mvvm/module/index/index_route.dart';
import './module/common/extension/color_ext.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter MVVM',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
          appBar: CupertinoNavigationBar(
            middle: const Text('Flutter MVVM'),
          ),
          body: IndexRoute()),
    );
    // return CupertinoApp(
    //   title: 'Flutter MVVM',
    //   // theme: ThemeData(
    //   //   primarySwatch: Colors.blue,
    //   // ),
    //   home: CupertinoPageScaffold(
    //     navigationBar: const CupertinoNavigationBar(
    //       middle: Text('Flutter MVVM'),
    //     ),
    //     child: Material(child: IndexRoute(),),
    //   ),
    // );
  }
}

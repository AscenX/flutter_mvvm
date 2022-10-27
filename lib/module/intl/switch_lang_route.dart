import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class _SwitchLangState extends State<SwitchLangRoute> {
  String currentLang = 'En';
  List allLangs = ['English', '中文'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CupertinoNavigationBar(
          middle: Text('Swtich lang'),
        ),
        body: Container(
          child: ListView.separated(
            itemBuilder: (ctx, idx) {
              return Container(
                height: 44.0,
                padding: const EdgeInsets.only(left: 16),
                alignment: Alignment.centerLeft,
                child: Text(allLangs[idx]),
              );
            },
            separatorBuilder: (ctx, idx) => const Divider(height: 0.5),
            itemCount: allLangs.length,
          ),
        ));
  }
}

class SwitchLangRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SwitchLangState();
}

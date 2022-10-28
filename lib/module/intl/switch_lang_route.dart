import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mvvm/generated/l10n.dart';
import 'package:flutter_mvvm/module/common/EventBus.dart';

class _SwitchLangState extends State<SwitchLangRoute> {
  String currentLang = 'En';
  List allLangs = ['English', '中文'];

  @override
  Widget build(BuildContext context) {

    String title = S.current.switch_lang;

    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
          middle: Text(S.current.switch_lang),
        ),
        child: Container(
          child: ListView.separated(
            itemBuilder: (ctx, idx) {
              return Material(
                child: Ink(
                  child: InkWell(
                    onTap: (){
                      if (idx == 0) {
                        S.delegate.load(const Locale('en'));
                      } else {
                        S.delegate.load(const Locale('zh'));
                      }

                      EventBus().emit('ChangeLanguage');

                      Navigator.of(context).pop();
                    },
                    child: Container(
                      height: 44.0,
                      padding: const EdgeInsets.only(left: 16),
                      alignment: Alignment.centerLeft,
                      child: Text(allLangs[idx]),
                    ),
                  ),
                ),
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

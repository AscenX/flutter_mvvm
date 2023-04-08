import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mvvm/generated/l10n.dart';
import 'package:flutter_mvvm/module/common/EventBus.dart';

class _SwitchLangState extends State<SwitchLangPage> {


  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: CupertinoNavigationBar(
          middle: Text(S.current.switch_lang),
          leading: CupertinoNavigationBarBackButton(
              color: Colors.black,
              onPressed: () {
                Navigator.of(context).pop();
              }),
          padding: const EdgeInsetsDirectional.only(start: 5),
        ),
        body: Container(
          child: ListView.separated(
            itemBuilder: (ctx, idx) {
              return Material(
                child: Ink(
                  child: InkWell(
                    onTap: () {
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
                      child: Text(S.delegate.supportedLocales[idx].languageCode),
                    ),
                  ),
                ),
              );
            },
            separatorBuilder: (ctx, idx) => const Divider(height: 0.5),
            itemCount: S.delegate.supportedLocales.length,
          ),
        ));
  }
}

class SwitchLangPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SwitchLangState();
}

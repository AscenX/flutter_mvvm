
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mvvm/module/intl/switch_lang_route.dart';
import 'package:flutter_mvvm/generated/l10n.dart';

class _IntlState extends State<IntlRoute> {

  String currentLang = 'En';

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: EdgeInsets.fromLTRB(20, 32, 20, 20),
      child: Column(
        children: [
          Text('${S.current.current_lang}:${Localizations.maybeLocaleOf(context).toString()}'),
          SizedBox(height: 50),
          OutlinedButton(onPressed: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (ctx){
              return SwitchLangRoute();
            }));
          }, child: Text(S.current.switch_lang))
        ],
      ),
    );
  }

}

class IntlRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _IntlState();

}
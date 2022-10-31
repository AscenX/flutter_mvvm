
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mvvm/module/login/login_route.dart';

class _UserRouteState extends State<UserRoute> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          Text('UserInfo:'),
          OutlinedButton(onPressed: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (ctx){
              return LoginRoute();
            }, fullscreenDialog: true));
          }, child: Text('Login'))
        ],
      ),
    );
  }
  
}

class UserRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _UserRouteState();
  
}
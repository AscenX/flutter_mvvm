import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mvvm/module/common/redux/app_state.dart';
import 'package:flutter_mvvm/module/common/redux/app_store.dart';
import 'package:flutter_mvvm/module/common/user_info/user_info.dart';
import 'package:flutter_mvvm/module/ui/login/login_route.dart';

class _UserRouteState extends State<UserRoute> {

  Widget buildContainer(Store store) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          Text('UserInfo:${store.state.userInfo?.toJson().toString()}'),
          OutlinedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (ctx) {
                      return LoginRoute();
                    },
                    fullscreenDialog: true));
              },
              child: Text('Login'))
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {


    // Widget container(Store store) =  Container(
    //   padding: EdgeInsets.all(16),
    //   child: Column(
    //     children: [
    //       // Text('UserInfo:${store.state}'),
    //       OutlinedButton(
    //           onPressed: () {
    //
    //             Navigator.of(context).push(MaterialPageRoute(
    //                 builder: (ctx) {
    //                   return LoginRoute();
    //                 },
    //                 fullscreenDialog: true));
    //           },
    //           child: Text('Login'))
    //     ],
    //   ),
    // );
    return StoreBuilder(builder: (ctx, store){
      print('11111111 builder: ctx: $ctx, store: ${store.toString()}');
      return buildContainer(store);
    });
  }
}

class UserRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _UserRouteState();
}

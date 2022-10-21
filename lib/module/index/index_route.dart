
import 'package:flutter/cupertino.dart';
import 'package:flutter_mvvm/module/index/index_view_model.dart';


class IndexState extends State<IndexRoute> {

  late IndexViewModel vm;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    vm = IndexViewModel(this);

    vm.fetchDataCmd.listen((value) {
      print('33333333 fetchDataCmd listen:$value');
    }).onError((err){
      print('44444444 index:$err');
    });

    vm.fetchDataCmd.execute();
  }

  @override
  Widget build(BuildContext context) {
    return Text('index');
  }

}

class IndexRoute extends StatefulWidget {


  @override
  State<StatefulWidget> createState() => IndexState();

}

import 'dart:async';

import 'package:after_layout/after_layout.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_mvvm/module/common/base_widget/table_view.dart';
import 'package:flutter_mvvm/module/index/index_view_model.dart';
import 'package:rx_command/rx_command.dart';


class IndexState extends State<IndexRoute> with AfterLayoutMixin<IndexRoute> {

  late IndexViewModel vm;

  late final TableController tableController;

  List dataSource = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    vm = IndexViewModel(this);
    tableController = TableController();

    // vm.getRequestCmd.listen((value) {
    //   print('11111111 getRequestCmd listen:$value');
    // }).onError((err){
    //   print('11111111 index get:$err');
    // });
    //
    // vm.postRequestCmd.listen((value) {
    //   print('22222222 postRequestCmd listen:$value');
    // }).onError((err){
    //   print('22222222 index post:$err');
    // });

    vm.listRequestCmd.listen((value) {
      dataSource = value;
      tableController.endRefresh(count: value.length);
      setState(() {
      });
    }).onError((err){
      tableController.endRefresh();
      print('33333333 index list err:$err');
    });

    // vm.getRequestCmd.execute();
    // vm.postRequestCmd.execute();
  }

  Widget buildItem(BuildContext ctx, int idx) {
    return Container(
      height: 44,
      child: Row(
        children: [
          Text('Index:$idx--'),
          Text('${dataSource[idx].id}'),
          Text('${dataSource[idx].title}'),
          Text('${dataSource[idx].content}'),
        ],
      ),
    );
  }



  @override
  Widget build(BuildContext context) {
    return TableView(dataCount: dataSource.length, itemBuilder: buildItem, onRefresh: (){
      print("111111 refresh:${vm.listRequestCmd.canExecute}");
      vm.listRequestCmd.execute(1);
    }, onLoad: (){
      print("111111 load");
      vm.listRequestCmd.execute(0);
    }, controller: tableController,);
  }

  @override
  FutureOr<void> afterFirstLayout(BuildContext context) {
    print('11111 after layout');
    tableController.beginRefresh();
  }

}

class IndexRoute extends StatefulWidget {


  @override
  State<StatefulWidget> createState() => IndexState();



}
import 'dart:async';

import 'package:after_layout/after_layout.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mvvm/module/common/widget/table_view.dart';
import 'package:flutter_mvvm/module/index/detail/index_detail_route.dart';
import 'package:flutter_mvvm/module/index/index_list_item.dart';
import 'package:flutter_mvvm/module/index/index_view_model.dart';

class IndexState extends State<IndexRoute> with AfterLayoutMixin<IndexRoute> {
  late IndexViewModel vm;

  late final TableController tableController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    vm = IndexViewModel();
    tableController = TableController();

    vm.listRequestCmd.listen((value) {
      tableController.endRefresh(count: value.length);
      setState(() {});
    }).onError((err) {
      tableController.endRefresh();
      setState(() {});
    });
  }

  Widget buildItem(BuildContext context, int index) {
    return IndexListItem(
        vm: vm,
        index: index,
        tap: (itemData) {
          print('list item tap in index: $index');

          Navigator.of(context).push(MaterialPageRoute(
              builder: (ctx) {
                return IndexDetailRoute(detailId: itemData?.id ?? '');
              },
              settings: const RouteSettings(name: 'detail')));
        });
  }

  @override
  Widget build(BuildContext context) {
    return TableView(
      dataCount: vm.dataSource.length,
      itemBuilder: buildItem,
      onRefresh: () {
        vm.listRequestCmd.execute(1);
      },
      onLoad: () {
        vm.listRequestCmd.execute(0);
      },
      controller: tableController,
    );
  }

  @override
  FutureOr<void> afterFirstLayout(BuildContext context) {
    tableController.beginRefresh();
  }
}

class IndexRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => IndexState();
}

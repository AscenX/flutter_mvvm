
import 'package:flutter/material.dart';
import 'package:flutter_mvvm/module/common/base/base_view_model.dart';

class _ListItemState extends State<ListItem> {
  @override
  Widget build(BuildContext context) {
    return widget;
  }

}

abstract class ListItem<T> extends StatefulWidget {

  ListItem({super.key, required this.vm, required this.index, this.tap}) {
    itemData = vm.dataSource[index];
  }

  final BaseViewModel vm;
  final int index;
  final void Function(T itemData)? tap;
  late T itemData;

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ListItemState();
  }
  // @override
  // Widget build(BuildContext context) {
  //   return Container(
  //   );
  // }
}
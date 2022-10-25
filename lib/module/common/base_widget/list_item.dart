
import 'package:flutter/material.dart';
import 'package:flutter_mvvm/module/common/base_widget/base_view_model.dart';

// class _ListItemState extends State<ListItem> {
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: Colors.white, // 默认白色背景
//       child: widget.itemBuilder(widget.vm.dataSource[widget.index]),
//     );
//   }
//
// }

abstract class ListItem<T> extends StatelessWidget {

  ListItem({super.key, required this.vm, required this.index}) {
    itemData = vm.dataSource[index];
  }

  final BaseViewModel vm;
  final int index;
  late T itemData;

  @override
  Widget build(BuildContext context) {
    return Container(
    );
  }
}
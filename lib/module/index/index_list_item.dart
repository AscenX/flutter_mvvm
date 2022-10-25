import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mvvm/module/common/base_widget/list_item.dart';
import 'package:flutter_mvvm/module/index/index_data.dart';

class IndexListItem extends ListItem<IndexData> {
  IndexListItem({super.key, required super.vm, required super.index});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
          height: 44,
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: Row(
            children: [
              Text('index:${itemData.index}, '),
              Text('${itemData.name}, '),
              Text('age: ${itemData.age}'),
            ],
          )),
      // Expanded(child: Container()),
      const Divider(
        height: 1.5,
        color: Colors.black26,
        indent: 20,
        endIndent: 20,
      )
    ]);
  }
}

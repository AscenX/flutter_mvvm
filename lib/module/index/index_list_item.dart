import 'package:flutter/cupertino.dart';
import 'package:flutter_mvvm/module/common/base_widget/list_item.dart';
import 'package:flutter_mvvm/module/index/index_data.dart';

class IndexListItem extends ListItem<IndexData> {

  IndexListItem({super.key, required super.vm, required super.index});

  @override
  Widget build(BuildContext context) {
  return Container(
    height: 44,
    padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
    child: Row(
      children: [
        Text('Index:$index:'),
        Text('${itemData.id}'),
        Text('${itemData.title}'),
        Text('${itemData.content}'),
      ],
    ),
  );
  }


}

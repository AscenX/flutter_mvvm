import 'package:flutter/material.dart';
import 'package:flutter_mvvm/module/common/widget/list_item.dart';
import 'package:flutter_mvvm/module/index/index_data.dart';

class _IndexListItemState extends State<IndexListItem> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Ink(
        color: Colors.white,
        child: InkWell(
          onTap: (){
            if (widget.tap != null) {
              widget.tap!(widget.itemData);
            }
          },
          child: Column(children: [
            Container(
                height: 44,
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                // color: Colors.transparent,
                child: Row(
                  children: [
                    Text('index:${widget.itemData.index}, '),
                    Text('${widget.itemData.name}, '),
                    Text('age: ${widget.itemData.age}'),
                  ],
                )),
            const Divider(
              height: 1.5,
              color: Colors.black26,
              indent: 20,
              endIndent: 20,
            )
          ]),
        ),
      ),
    );
  }
}

class IndexListItem extends ListItem<IndexData> {
  IndexListItem(
      {super.key, required super.vm, required super.index, super.tap});

  @override
  State<StatefulWidget> createState() {
    return _IndexListItemState();
  }
}

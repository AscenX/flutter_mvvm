import 'dart:async';

import 'package:after_layout/after_layout.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mvvm/module/index/detail/index_detail_view_model.dart';

class _IndexDetailState extends State<IndexDetailRoute>
    with AfterLayoutMixin<IndexDetailRoute> {
  late IndexDetailViewModel vm;

  @override
  void initState() {
    super.initState();

    // 初始化viewModel
    vm = IndexDetailViewModel(widget.detailId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CupertinoNavigationBar(
          middle: Text('Detail'),
        ),
        body: Container(
          // color: const Color(0x00ffc100),
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.fromLTRB(20, 32, 20, 20),
          child: StreamBuilder(
            // stream: vm.detailRequestCmd,
            builder: (ctx, snapShot) {
              return Column(
                children: [
                  Text('Detail Info'),
                  SizedBox(
                    height: 20,
                  ),
                  Text('Index:1'),
                  Text('Name: name'),
                  Text('Age:100'),
                ],
                crossAxisAlignment: CrossAxisAlignment.start,
              );
            },
          ),
        ));
    // return CupertinoPageScaffold(
    //     navigationBar: const CupertinoNavigationBar(
    //       middle: Text('Detail'),
    //     ),
    //     child: Container(
    //       color: Colors.white,
    //       padding: const EdgeInsets.fromLTRB(20, 88, 20, 20),
    //       child: Column(
    //         children: [
    //           Container(
    //             child: Center(
    //               child: Text('Detail Page'),
    //             ),
    //           )
    //         ],
    //       ),
    //     )
    // );
  }

  @override
  FutureOr<void> afterFirstLayout(BuildContext context) {}
}

class IndexDetailRoute extends StatefulWidget {
  const IndexDetailRoute({super.key, required this.detailId});

  final String detailId;

  @override
  State<StatefulWidget> createState() => _IndexDetailState();
}

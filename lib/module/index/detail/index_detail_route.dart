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

    vm.detailRequestCmd.execute();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CupertinoNavigationBar(
          middle: Text('Detail'),
        ),
        body: Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.fromLTRB(20, 32, 20, 20),
          child: FutureBuilder(
            future: vm.detailRequestCmd.first,
            builder: (ctx, snapShot) {
              print('111111 snapShot:${snapShot.data}, ${snapShot.connectionState}');
              if (snapShot.connectionState == ConnectionState.waiting) {
                return SizedBox(
                  height: MediaQuery.of(context).size.height * 0.5,
                  child: const Center(
                    child: CupertinoActivityIndicator(),
                  ),
                );
              } else if (snapShot.data != null) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Detail Info'),
                    const SizedBox(
                      height: 20,
                    ),
                    Text('id: ${snapShot.data.id}'),
                    Text('Name: ${snapShot.data.name}'),
                    Text('Age: ${snapShot.data.age}'),
                  ],
                );
              } else {
                return Container();
              }
            },
          ),
        ));
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

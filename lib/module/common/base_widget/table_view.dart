import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter_mvvm/module/common/base_widget/list_item.dart';

class _TableViewState extends State<TableView>
    with SingleTickerProviderStateMixin {
  final _controller = EasyRefreshController(
    controlFinishRefresh: true,
    controlFinishLoad: true,
  );

  bool _isShowLoading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // 绑定state
    widget.controller?._bind(this);
  }

  @override
  void didUpdateWidget(covariant TableView oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.controller != null &&
        oldWidget.controller != widget.controller) {
      widget.controller?._bind(this);
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    Widget emptyWidget = Positioned(
      child: SizedBox(
        width: width,
        height: height * 0.5,
        child: const Center(child: Text('No data')),
      ),
    );

    List<Widget> stackChildren = [
      Positioned(
        child: EasyRefresh(
          controller: _controller,
          onRefresh: widget.onRefresh,
          onLoad: widget.onLoad,
          child: ListView.separated(
            itemBuilder: (ctx, idx) {
              if (widget.dataCount == 0) {
                return Container();
              } else {
                return widget.itemBuilder!(ctx, idx);
              }
            },
            separatorBuilder: buildSeparator,
            itemCount: widget.dataCount == 0 ? 1 : widget.dataCount,
          ), // Positioned(top: refreshHeaderOffset, child: refreshHeader)
        ),
      ),
    ];

    if (widget.dataCount == 0 && !_isShowLoading) {
      stackChildren.add(emptyWidget);
    }
    if (widget.dataCount > 0 && stackChildren.contains(emptyWidget)) {
      stackChildren.remove(emptyWidget);
    }

    if (_isShowLoading) {

      Widget loadingWidget = Container(
        height: height * 0.5,
        child: const Center(
          child: CupertinoActivityIndicator(),
        ),
      );

      stackChildren.add(loadingWidget);
    }

    return Container(
        width: width,
        height: height,
        color: Colors.white,
        child: Stack(
          children: stackChildren,
        ));
  }
}

Widget buildSeparator(BuildContext ctx, int index) {
  return const Divider(
    height: 0.5,
    color: Colors.black12,
  );
}

class TableController {
  _TableViewState? _state;

  void beginRefresh() {
    _state?._controller.callRefresh();
  }

  void endRefresh({int? count}) {
    _state?._controller.finishRefresh(IndicatorResult.none);
    if (count != null && count < 20) {
      _state?._controller.finishLoad(IndicatorResult.noMore);
    } else {
      _state?._controller.finishLoad(IndicatorResult.success);
    }
    _state?._controller.resetHeader();
    _state?._controller.resetFooter();
  }

  void showLoading() {
    _state?._isShowLoading = true;
    _state?.setState(() {
    });
  }

  void hideLoading() {
    _state?._isShowLoading = false;
    _state?.setState(() {
    });
  }

  void _bind(_TableViewState state) {
    _state = state;
  }

  void dispose() {
    _state = null;
  }
}

class TableView extends StatefulWidget {
  TableView(
      {super.key,
      required this.dataCount,
      this.controller,
      this.itemBuilder,
      this.onRefresh,
      this.onLoad});

  final TableController? controller;
  final IndexedWidgetBuilder? itemBuilder;
  final void Function()? onRefresh;
  final void Function()? onLoad;
  int dataCount = 0;

  @override
  State<StatefulWidget> createState() => _TableViewState();
}

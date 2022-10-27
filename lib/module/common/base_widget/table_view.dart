import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:easy_refresh/easy_refresh.dart';

class _TableViewState extends State<TableView>
    with SingleTickerProviderStateMixin {
  final _controller = EasyRefreshController(
    controlFinishRefresh: true,
    controlFinishLoad: true,
  );

  bool _isShowLoading = false;
  /// 是否已经加载，未加载前不展示no data
  bool _isLoaded = false;

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
          child: ListView.builder(
            itemBuilder: (ctx, idx) {
              if (widget.dataCount == 0) {
                return Container();
              } else {
                return widget.itemBuilder!(ctx, idx);
              }
            },
            itemCount: widget.dataCount == 0 ? 1 : widget.dataCount,
          ), // Positioned(top: refreshHeaderOffset, child: refreshHeader)
        ),
      ),
    ];

    if (widget.dataCount == 0 && !_isShowLoading && _isLoaded) {
      stackChildren.add(emptyWidget);
    }
    if (widget.dataCount > 0 && stackChildren.contains(emptyWidget)) {
      stackChildren.remove(emptyWidget);
    }

    if (_isShowLoading) {

      Widget loadingWidget = SizedBox(
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

class TableController {
  _TableViewState? _state;

  void beginRefresh() {
    _state?._controller.callRefresh();
  }

  void endRefresh({int? count}) {
    _state?._isLoaded = true;
    _state?._controller.finishRefresh(IndicatorResult.none);
    _state?._controller.resetHeader();
    if (count != null && count < 20) {
      _state?._controller.finishLoad(IndicatorResult.noMore);
    } else {
      _state?._controller.finishLoad(IndicatorResult.none);
      _state?._controller.resetFooter();
    }
    // _state?.setState(() {
    // });

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
      this.onLoad}){
    print('init table view');
  }

  final TableController? controller;
  final IndexedWidgetBuilder? itemBuilder;
  final void Function()? onRefresh;
  final void Function()? onLoad;
  int dataCount = 0;

  @override
  State<StatefulWidget> createState() => _TableViewState();
}

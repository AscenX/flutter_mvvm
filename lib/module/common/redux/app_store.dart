

import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_mvvm/module/common/redux/app_actions.dart';
import 'package:flutter_mvvm/module/common/redux/app_reducer.dart';
import 'package:flutter_mvvm/module/common/redux/app_state.dart';

class Store  {

  Store._internal()  {
    _state = AppState();
  }

  static final Store shared = Store._internal();


  AppState get state => _state;
  late AppState _state;

  final StreamController<AppState> _sc = StreamController<AppState>();
  late final Stream<AppState> didUpdate = _sc.stream;

  void updateState(AppState newState) {
    _state = newState;

    _sc.add(newState);
  }


  void dispatch(BaseAction action) {
    AppState newState = appReducer(state, action);
    updateState(newState);
  }

}

class _StoreBuilderState extends State<StoreBuilder> {

  late StreamSubscription? _listen;

  @override
  void initState() {
    super.initState();

    _listen = Store.shared.didUpdate?.listen((event) {
      setState(() {
      });
    });
  }

  @override
  void dispose() {

    super.dispose();

    if (_listen != null) {
      _listen!.cancel();
    }
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder(context, Store.shared);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    // TODO: implement toString
    return 'Store: ${Store.shared.state.toString()}';
  }
}

class StoreBuilder extends StatefulWidget {

  Widget Function(BuildContext context, Store store) builder;

  StoreBuilder({super.key, required this.builder});

  @override
  State<StatefulWidget> createState() => _StoreBuilderState();
  
}
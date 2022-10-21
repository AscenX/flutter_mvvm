

import 'package:dio/dio.dart';
import 'package:flutter_mvvm/module/common/network/api_request.dart';
import 'package:flutter_mvvm/module/index/Httpbin.dart';
import 'package:flutter_mvvm/module/index/index_api.dart';
import 'package:flutter_mvvm/module/index/index_data.dart';
import 'package:rx_command/rx_command.dart';
import 'package:rxdart/rxdart.dart';
import 'index_route.dart';

class IndexViewModel {

  IndexViewModel(this.state);

  final IndexState state;


  IndexData? _indexData;

  Httpbin? bin = Httpbin();

  void setupBin(bin) async {
    this.bin = bin;
  }

  final fetchDataCmd = RxCommand.createFromStream((param) => IndexAPI.indexPage.request().map((event) {
    if (event is Response) {
      return Httpbin.fromJson(event.data);
    }
    return 'parse error';
  }).doOnError((p0, p1) {
    print('111111 error:$p0');
  }));

}
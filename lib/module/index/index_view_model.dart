import 'package:dio/dio.dart';
import 'package:flutter_mvvm/module/common/base_widget/base_view_model.dart';
import 'package:flutter_mvvm/module/common/network/api_request.dart';
import 'package:flutter_mvvm/module/index/index_api.dart';
import 'package:flutter_mvvm/module/index/index_data.dart';
import 'package:rx_command/rx_command.dart';
import 'package:rxdart/rxdart.dart';

class IndexViewModel extends BaseViewModel {


  late final RxCommand listRequestCmd;

  @override
  void init() {
    super.init();

    listRequestCmd = RxCommand.createAsync((param) {
      int page = (param as int) ?? 1;
      return IndexAPI.listRequest(page).request().map((event) {
        if (event is Response) {
          List<dynamic> list = event.data;
          return list.map((e) => IndexData.fromJson(e)).toList();
        }
        return [];
      }).doOnData((event) {
        dataSource = event;
      }).first;
    });
  }


}

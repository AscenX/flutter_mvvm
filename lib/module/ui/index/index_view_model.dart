import 'package:flutter_mvvm/module/common/base/base_view_model.dart';
import 'package:flutter_mvvm/module/common/network/api_request.dart';
import 'package:flutter_mvvm/module/ui/index/index_api.dart';
import 'package:flutter_mvvm/module/ui/index/index_data.dart';
import 'package:rx_command/rx_command.dart';
import 'package:rxdart/rxdart.dart';

class IndexViewModel extends BaseViewModel {
  late final RxCommand listRequestCmd;

  @override
  void init() {
    super.init();

    listRequestCmd = RxCommand.createAsync((param) {
      page = (param as int) == 1 ? 1 : page + 1;
      Map<String, dynamic> params = {'page': page, 'pageSize': 20};
      return IndexAPI.listRequest(params).mockRequest().map((event) {
        // if (event is Response) {
        List<dynamic> list = event;
        List data = list.map((e) => IndexData.fromJson(e)).toList();

        // 模拟网络请求分页
        int end = (page - 1) * 20 + 20;
        end = end > data.length ? data.length : end;
        data = data.sublist((page - 1) * 20, end);
        return data;
        // }
        return [];
      }).doOnData((event) {
        if (page == 1) {
          dataSource = [];
        }
        dataSource += event;
      }).first;
    });
  }
}

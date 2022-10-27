import 'package:flutter_mvvm/module/common/base_widget/base_view_model.dart';
import 'package:flutter_mvvm/module/common/network/api_request.dart';
import 'package:flutter_mvvm/module/index/index_api.dart';
import 'package:flutter_mvvm/module/index/index_data.dart';
import 'package:rx_command/rx_command.dart';
import 'package:rxdart/rxdart.dart';

class IndexDetailViewModel extends BaseViewModel {


  final String detailId;
  IndexDetailViewModel(this.detailId);

  late final RxCommand detailRequestCmd;



  @override
  void init() {
    super.init();

    detailRequestCmd = RxCommand.createAsync((param) {
      Map<String, dynamic> params = {
        'detailId' : detailId,
      };
      return IndexAPI.detailRequest(params).mockRequest().map((event) {
        // if (event is Response) {
        List<dynamic> list = event;
        List data = list.map((e) => IndexData.fromJson(e)).toList();

        return data.firstWhere((element) => element.id == detailId );
        // }
        return [];
      }).first;
    });
  }


}

import 'package:dio/dio.dart';
import 'package:flutter_mvvm/module/common/network/api_request.dart';
import 'package:flutter_mvvm/module/index/Httpbin.dart';
import 'package:flutter_mvvm/module/index/Httpbin_post.dart';
import 'package:flutter_mvvm/module/index/Test_data.dart';
import 'package:flutter_mvvm/module/index/index_api.dart';
import 'package:flutter_mvvm/module/index/index_data.dart';
import 'package:rx_command/rx_command.dart';
import 'index_route.dart';

class IndexViewModel {
  IndexViewModel(this.state);

  final IndexState state;

  IndexData? _indexData;

  Httpbin? bin = Httpbin();

  void setupBin(bin) async {
    this.bin = bin;
  }

  // final getRequestCmd = RxCommand.createFromStream(
  //     (param) => IndexAPI.getRequest().request().map((event) {
  //           return Httpbin.fromJson(event.data);
  //           return 'parse error';
  //         }));
  //
  // final postRequestCmd = RxCommand.createFromStream(
  //     (param) => IndexAPI.postRequest().request().map((event) {
  //           if (event is Response) {
  //             return HttpbinPost.fromJson(event.data);
  //           }
  //           return 'parse error';
  //         }));

  // final listRequestCmd = RxCommand.createFromStream((param) {
  //   int page = (param as int) ?? 1;
  //   print('111111 listRequestCmd page:$page');
  //   return IndexAPI.listRequest(page).request().map((event) {
  //     if (event is Response) {
  //       List<dynamic> list = event.data;
  //       List<TestData> dataArr = [];
  //       for (var d in list) {
  //         TestData testData = TestData.fromJson(d);
  //         dataArr.add(testData);
  //       }
  //       return dataArr;
  //     }
  //     return [];
  //   });
  // });

  List dataSource = [];
  final listRequestCmd = RxCommand.createAsync((param) {

    int page = (param as int) ?? 1;
    return IndexAPI.listRequest(page).request()
        .map((event) {
      if (event is Response) {
        List<dynamic> list = event.data;
        List<TestData> dataArr = [];
        for (var d in list) {
          TestData testData = TestData.fromJson(d);
          dataArr.add(testData);
        }
        return dataArr;
      }
      return [];
    }).first;
  });









  // late final testList = [];
  // final listRequestCmd = RxCommand.createAsync((param) {
  //     int page = (param as int) ?? 1;
  //     return IndexAPI.listRequest(page).request();
  // });
  //   print('111111 listRequestCmd page:$page');
  //   return IndexAPI.listRequest(page).request().map((event) {
  //     if (event is Response) {
  //       List<dynamic> list = event.data;
  //       List<TestData> dataArr = [];
  //       for (var d in list) {
  //         TestData testData = TestData.fromJson(d);
  //         dataArr.add(testData);
  //       }
  //       return dataArr;
  //     }
  //     return [];
  //   });
  // });
  
  
  
}


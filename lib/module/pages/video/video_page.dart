import 'package:flutter/material.dart';
import 'package:flutter_aliplayer/flutter_alilistplayer.dart';
import 'package:flutter_aliplayer/flutter_aliplayer_factory.dart';
import 'package:flutter_mvvm/module/common/network/base_api.dart';
import 'package:flutter_mvvm/module/common/network/network_client.dart';
import 'video_model.dart';

class VideoPage extends StatefulWidget {
  const VideoPage({super.key});

  @override
  State<StatefulWidget> createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage> with WidgetsBindingObserver {
  late PageController _pageController;

  late FlutterAliListPlayer fAliListPlayer;

  int _curIdx = 0;
  int _lastCurIndex = -1;
  bool _isPause = false;
  double _playerY = 0;
  bool _isFirstRenderShow = false;

  List _dataList = [];
  int _page = 1;

  @override
  void initState() {
    super.initState();

    _pageController = PageController(initialPage: _curIdx);

    WidgetsBinding.instance.addObserver(this);
    fAliListPlayer =
        FlutterAliPlayerFactory.createAliListPlayer(playerId: 'aliListPlayer');
    fAliListPlayer.setAutoPlay(true);
    fAliListPlayer.setLoop(true);
    var configMap = {
      'mClearFrameWhenStop': true,
    };
    fAliListPlayer.setConfig(configMap);

    fAliListPlayer.setOnRenderingStart((playerId) {
      Future.delayed(Duration(milliseconds: 50), () {
        setState(() {
          _isFirstRenderShow = true;
        });
      });
    });

    fAliListPlayer.setOnStateChanged((newState, playerId) {
      switch (newState) {
        case FlutterAvpdef.AVPStatus_AVPStatusStarted:
          setState(() {
            // _isBackgroundMode = false;
            _isPause = false;
          });
          break;
        case FlutterAvpdef.AVPStatus_AVPStatusPaused:
          setState(() {
            _isPause = true;
          });
          break;
        default:
      }
    });

    fAliListPlayer.setOnError((errorCode, errorExtra, errorMsg, playerId) {
      // Fluttertoast.showToast(msg: errorMsg);
    });

    _onRefresh();
  }

  _onRefresh() async {
    _page = 1;
    _dataList = [];
    _loadData();
  }

  _loadData() async {
    NetworkClient.shared
        .request(path: "user/randomUser", method: "get")
        .listen((resp) {
      String token = resp.data['data']['token'];
      NetworkClient.shared.request(
          path: "vod/getRecommendVideoList",
          method: "get",
          params: {
            'token': token,
            "pageIndex": _page,
            "pageSize": 10
          }).listen((resp) {
        print('data=$resp');
        _loadDataFinish(resp.data);
      });
    });
  }

  _loadDataFinish(data) {
    VideoListModel videoListModel = VideoListModel.fromJson(data['data']);
    if (videoListModel.videoList.isNotEmpty) {
      videoListModel.videoList.forEach((element) {
        // if (widget.playMode == ModeType.URL) {
          fAliListPlayer.addUrlSource(
              url: element.fileUrl, uid: element.videoId);
        // }
      });

      _dataList.addAll(videoListModel.videoList);
    }
    // _refreshController.refreshCompleted();
    // _videoListRefreshController.refreshCompleted();
    // if (videoListModel.videoList.length < 10) {
    //   _refreshController.loadNoData();
    //   _videoListRefreshController.loadNoData();
    // } else {
    //   _refreshController.loadComplete();
    //   _videoListRefreshController.loadComplete();
    // }
    setState(() {});
  }

  @override
  void dispose() {
    super.dispose();
    this.fAliListPlayer.clear();
    this.fAliListPlayer.stop();
    this.fAliListPlayer.destroy();
    WidgetsBinding.instance.removeObserver(this);
  }

  ///3、设置渲染的 View
  @override
  Widget build(BuildContext context) => _buildFullScreenView();

  void onViewPlayerCreated(viewId) async {
    fAliListPlayer.setPlayerView(viewId);
  }

  void start() async {
    if (_dataList != null &&
        _dataList.length > 0 &&
        _curIdx < _dataList.length) {
      VideoModel model = _dataList[_curIdx];
      setState(() {
        _isPause = false;
        _isFirstRenderShow = false;
      });
      this.fAliListPlayer.stop();
      this.fAliListPlayer.moveTo(uid: model.videoId);

    }
  }

  Widget _buildSingleScreen(int index) {
    VideoModel model = _dataList[index];
    return GestureDetector(
      onTap: () {
        setState(() {
          _isPause = !_isPause;
        });
        if (_isPause) {
          this.fAliListPlayer.pause();
        } else {
          this.fAliListPlayer.play();
        }
      },
      child: Container(
        // color: Colors.black,
        child: Stack(
          children: [
            Offstage(
              offstage: _curIdx == index && _isFirstRenderShow,
              child: Container(
                color: Colors.black,
                child: Image.network(
                  model.coverUrl ?? '',
                  // color:Colors.black,
                  fit: BoxFit.contain,
                  alignment: Alignment.center,
                  width: double.infinity,
                  height: double.infinity,
                ),
              ),
            ),
            Container(
              color: Colors.black.withAlpha(0),
              alignment: Alignment.center,
              child: Offstage(
                offstage: _isPause == false,
                child: Icon(
                  Icons.play_circle_filled,
                  size: 48,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _buildFullScreenView() {
    return WillPopScope(
      onWillPop: () async {
        // if (_showMode == VideoShowMode.Screen) {
        //   _exitScreenMode();
        //   return false;
        // }
        return true;
      },
      child: Scaffold(
        backgroundColor: Colors.black,
        body: NotificationListener(
          onNotification: (ScrollNotification notification) {
            if (notification.depth == 0 &&
                notification is ScrollUpdateNotification) {
              final PageMetrics metrics = notification.metrics as PageMetrics;
              _playerY =
                  metrics.pixels - _curIdx * MediaQuery.of(context).size.height;
              setState(() {});
            } else if (notification is ScrollEndNotification) {
              _playerY = 0.0;
              PageMetrics metrics = notification.metrics as PageMetrics;
              _curIdx = metrics.page?.round() ?? 0;
              if (_lastCurIndex != _curIdx) {
                start();
              }
              _lastCurIndex = _curIdx;
            }
            return false;
          },
          child: Stack(
            children: [
              Positioned(
                left: 0,
                bottom: _playerY,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: Container(
                  color: Colors.black,
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: AliPlayerView(
                    onCreated: onViewPlayerCreated,
                    x: 0,
                    y: _playerY,
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                  ),
                ),
              ),
              CustomScrollView(
                physics: PageScrollPhysics(),
                controller: _pageController,
                slivers: <Widget>[
                  SliverFillViewport(
                      delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                      return _buildSingleScreen(index);
                    },
                    childCount: _dataList.length,
                  ))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

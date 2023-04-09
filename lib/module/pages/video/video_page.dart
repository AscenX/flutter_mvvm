import 'package:flutter/material.dart';
import 'package:flutter_aliplayer/flutter_aliplayer.dart';
import 'package:flutter_aliplayer/flutter_aliplayer_factory.dart';
import 'package:visibility_detector/visibility_detector.dart';

// google test resources
const images = [
  "https://storage.googleapis.com/gtv-videos-bucket/sample/images/BigBuckBunny.jpg",
  "https://storage.googleapis.com/gtv-videos-bucket/sample/images/ElephantsDream.jpg",
  "https://storage.googleapis.com/gtv-videos-bucket/sample/images/ForBiggerBlazes.jpg",
  "https://storage.googleapis.com/gtv-videos-bucket/sample/images/ForBiggerEscapes.jpg",
  "https://storage.googleapis.com/gtv-videos-bucket/sample/images/ForBiggerFun.jpg",
  "https://storage.googleapis.com/gtv-videos-bucket/sample/images/ForBiggerJoyrides.jpg",
  "https://storage.googleapis.com/gtv-videos-bucket/sample/images/ForBiggerMeltdowns.jpg",
  "https://storage.googleapis.com/gtv-videos-bucket/sample/images/Sintel.jpg",
  "https://storage.googleapis.com/gtv-videos-bucket/sample/images/SubaruOutbackOnStreetAndDirt.jpg",
  "https://storage.googleapis.com/gtv-videos-bucket/sample/images/TearsOfSteel.jpg"
];

const videos = [
  "https://storage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4",
  "https://storage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4",
  "https://storage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4",
  "https://storage.googleapis.com/gtv-videos-bucket/sample/ForBiggerEscapes.mp4",
  "https://storage.googleapis.com/gtv-videos-bucket/sample/ForBiggerFun.mp4",
  "https://storage.googleapis.com/gtv-videos-bucket/sample/ForBiggerJoyrides.mp4",
  "https://storage.googleapis.com/gtv-videos-bucket/sample/ForBiggerMeltdowns.mp4",
  "https://storage.googleapis.com/gtv-videos-bucket/sample/Sintel.jpg",
  "https://storage.googleapis.com/gtv-videos-bucket/sample/SubaruOutbackOnStreetAndDirt.mp4",
  "https://storage.googleapis.com/gtv-videos-bucket/sample/TearsOfSteel.mp4"
];

class VideoPage extends StatefulWidget {
  const VideoPage({super.key});

  @override
  State<StatefulWidget> createState() => _VideoPageState();

}

class _VideoPageState extends State<VideoPage> with WidgetsBindingObserver,AutomaticKeepAliveClientMixin {

  @override
  bool get wantKeepAlive => true;

  late PageController _pageController;

  late FlutterAliplayer player;

  int _currentIdx = 0;

  bool _isPlaying = true;


  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addObserver(this);

    player = FlutterAliPlayerFactory.createAliPlayer();
    _pageController = PageController(initialPage: _currentIdx);

  }

  @override
  void deactivate() {
    super.deactivate();

    player.pause();
  }

  @override
  void activate() {
    super.activate();
  }

  @override
  void dispose() {
    player.destroy();

    WidgetsBinding.instance.removeObserver(this);

    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);

    if (state == AppLifecycleState.paused) {
      player.pause();
      _isPlaying = false;
    } else if (state == AppLifecycleState.resumed) {
      player.play();
      _isPlaying = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    var x = 0.0;
    var y = 0.0;
    var width = MediaQuery.of(context).size.width;

    var height = MediaQuery.of(context).size.height - 88 - 56;

    AliPlayerView aliPlayerView = AliPlayerView(
        onCreated: onViewPlayerCreated,
        x: x,
        y: y,
        width: width,
        height: height);

    return Scaffold(
          body: VisibilityDetector(
            onVisibilityChanged: (visibilityInfo) {
              var visiblePercentage = visibilityInfo.visibleFraction * 100;
              if (visiblePercentage < 100) {
                player.pause();
                _isPlaying = false;
              }
            },
            key: const Key("video_widget"),
            child: GestureDetector(
              onTap: () {
                _isPlaying = !_isPlaying;
                if (_isPlaying) {
                  player.play();
                } else {
                  player.pause();
                }
              },
              child: Container(
                  color: Colors.black,
                  width: width,
                  height: height,

                  child: AbsorbPointer(
                    absorbing: true,
                    child: aliPlayerView,
                  )
              )
            ),
          )
    );


  }

  void onViewPlayerCreated(viewId) async {
    ///将 渲染 View 设置给播放器
    player.setPlayerView(viewId);

    player.setUrl(videos.first);


    player.setAutoPlay(true);
    player.prepare();


  }

}

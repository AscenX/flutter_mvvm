import 'package:flutter/material.dart';
import 'package:flutter_mvvm/module/common/EventBus.dart';
import 'package:flutter_mvvm/module/pages/video/video_item.dart';

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

  late PageController _controller;

  late double _itemHeight;


  @override
  void initState() {
    super.initState();

    _controller = PageController();

    _controller.addListener(() {

    });
  }


  @override
  Widget build(BuildContext context) {
    _itemHeight = MediaQuery.of(context).size.height - 56 - 64;
    return PageView.builder(
        itemBuilder: _buildItem,
        itemCount: videos.length,
        controller: _controller,
        scrollDirection: Axis.vertical,
        onPageChanged: (idx) {
            EventBus().emit("VideoPageChanged", idx);
        },
    );
  }

  Widget _buildItem(BuildContext ctx, int index) {

    String coverImgUrl = images[index];
    String videoUrl = videos[index];

    return Container(
      height: _itemHeight,
      child: VideoItem(coverImgUrl: coverImgUrl, videoUrl: videoUrl, currentIdx: index,),
    );
  }

}

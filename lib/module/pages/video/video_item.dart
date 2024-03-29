import 'package:flutter/material.dart';
import 'package:flutter_mvvm/module/common/EventBus.dart';
import 'package:video_player/video_player.dart';

class VideoItem extends StatefulWidget {
  VideoItem({super.key, required this.currentIdx, required this.coverImgUrl, required this.videoUrl});

  int currentIdx = -1;
  String coverImgUrl;
  String videoUrl;

  @override
  State<StatefulWidget> createState() => _VideoItemState();

}

class _VideoItemState extends State<VideoItem> {

  late VideoPlayerController _controller;

  bool _isInit = false;

  @override
  void initState() {
    super.initState();

    _controller = VideoPlayerController.network(widget.videoUrl);

    _controller.addListener(() {
      if (_controller.value.isInitialized) {
        if (!_isInit) {
          _isInit = true;
          setState(() {

          });
        }
      }
    });

    _controller.initialize();
    _controller.play();

    EventBus().on("VideoPageChanged", (arg) {
      int index = arg;
      if (index != widget.currentIdx) {
        _controller.pause();
      } else {
        if (!_controller.value.isPlaying) {
          _controller.play();
        }
      }
    });
    EventBus().on("onVisibilityChanged", (arg) {
      int index = arg;
      if (index != widget.currentIdx) {
        _controller.pause();
      } else {
        _controller.play();
      }
    });

  }

  @override
  void dispose() {
    EventBus().off("VideoPageChanged");
    EventBus().off("onVisibilityChanged");
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Center(
        child: _controller.value.isInitialized
            ? AspectRatio(
          aspectRatio: _controller.value.aspectRatio,
          child: VideoPlayer(_controller),
        ) : Image.network(widget.coverImgUrl),
      ),
    );
  }
}
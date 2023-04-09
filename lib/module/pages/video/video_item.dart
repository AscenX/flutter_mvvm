import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoItem extends StatefulWidget {
  VideoItem({super.key, required this.coverImgUrl, required this.videoUrl});

  String coverImgUrl;
  String videoUrl;

  @override
  State<StatefulWidget> createState() => _VideoItemState();

}

class _VideoItemState extends State<VideoItem> {

  late VideoPlayerController _controller;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: _controller.value.isInitialized
            ? AspectRatio(
          aspectRatio: _controller.value.aspectRatio,
          child: VideoPlayer(_controller),
        )
            : Image.network(widget.coverImgUrl),
      ),
    );
  }
}
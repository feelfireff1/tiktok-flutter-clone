import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPost extends StatefulWidget {
  const VideoPost({
    super.key,
    required this.onVideoFinished,
  });

  final void Function() onVideoFinished;

  @override
  State<VideoPost> createState() => _VideoPostState();
}

class _VideoPostState extends State<VideoPost> {
  final VideoPlayerController _controller =
      VideoPlayerController.asset('assets/videos/video.mp4');

  @override
  void initState() {
    super.initState();

    _initVideoPlayer();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _initVideoPlayer() async {
    await _controller.initialize();
    _controller.addListener(_onVideoChanged);
    _controller.play();
    setState(() {});
  }

  void _onVideoChanged() {
    if (_controller.value.isInitialized) {
      if (_controller.value.duration == _controller.value.position) {
        widget.onVideoFinished();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: _controller.value.isInitialized
              ? VideoPlayer(_controller)
              : Container(
                  color: Colors.black,
                ),
        )
      ],
    );
  }
}

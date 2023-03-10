import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/constants.dart';
import 'package:tiktok_clone/features/videos/widgets/vertical_icon_text_button.dart';
import 'package:video_player/video_player.dart';
import 'package:visibility_detector/visibility_detector.dart';

class VideoPost extends StatefulWidget {
  const VideoPost({
    super.key,
    required this.onVideoFinished,
    required this.index,
  });

  final int index;
  final void Function() onVideoFinished;

  @override
  State<VideoPost> createState() => _VideoPostState();
}

class _VideoPostState extends State<VideoPost>
    with SingleTickerProviderStateMixin {
  final Duration _animationDuration = const Duration(milliseconds: 200);
  late final AnimationController _animationController;
  final VideoPlayerController _controller =
      VideoPlayerController.asset('assets/videos/video.mp4');

  bool _isPaused = false;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      lowerBound: 1.0,
      upperBound: 1.5,
      value: 1.5,
      vsync: this,
      duration: _animationDuration,
    );
    _initVideoPlayer();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _initVideoPlayer() async {
    await _controller.initialize();
    await _controller.setLooping(true);
    _controller.addListener(_onVideoChanged);
    setState(() {});
  }

  void _onVideoChanged() {
    if (_controller.value.isInitialized) {
      if (_controller.value.duration == _controller.value.position) {
        widget.onVideoFinished();
      }
    }
  }

  void _onVisibilityChanged(VisibilityInfo info) {
    if (info.visibleFraction == 1 && !_controller.value.isPlaying) {
      _controller.play();
    }
  }

  void _togglePause() {
    if (_controller.value.isPlaying) {
      _controller.pause();
      _animationController.reverse();
    } else {
      _controller.play();
      _animationController.forward();
    }

    setState(() {
      _isPaused = !_isPaused;
    });
  }

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: Key('${widget.index}'),
      onVisibilityChanged: _onVisibilityChanged,
      child: Stack(
        children: [
          Positioned.fill(
            child: _controller.value.isInitialized
                ? VideoPlayer(_controller)
                : Container(
                    color: Colors.black,
                  ),
          ),
          Positioned.fill(
            child: GestureDetector(
              onTap: _togglePause,
            ),
          ),
          Positioned.fill(
            child: IgnorePointer(
              child: Center(
                child: AnimatedBuilder(
                  animation: _animationController,
                  builder: (context, child) {
                    return Transform.scale(
                      scale: _animationController.value,
                      child: child,
                    );
                  },
                  child: AnimatedOpacity(
                    duration: _animationDuration,
                    opacity: _isPaused ? 1 : 0,
                    child: const FaIcon(
                      FontAwesomeIcons.play,
                      color: Colors.white,
                      size: Sizes.size52,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 20,
            left: 10,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  '@soojin',
                  style: TextStyle(
                    fontSize: Sizes.size14,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Gaps.v10,
                Text(
                  'This is actually the place.',
                  style: TextStyle(
                    fontSize: Sizes.size14,
                    color: Colors.white,
                    fontWeight: FontWeight.normal,
                  ),
                )
              ],
            ),
          ),
          Positioned(
              bottom: 20,
              right: 20,
              child: Column(
                children: const [
                  CircleAvatar(
                    radius: 25,
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.white,
                    foregroundImage: NetworkImage(
                        'https://avatars.githubusercontent.com/u/3890050'),
                    child: Text('??????'),
                  ),
                  Gaps.v24,
                  VerticalIconTextButton(
                    icon: FontAwesomeIcons.solidHeart,
                    text: '2.9M',
                  ),
                  Gaps.v20,
                  VerticalIconTextButton(
                    icon: FontAwesomeIcons.solidComment,
                    text: '33K',
                  ),
                  Gaps.v20,
                  VerticalIconTextButton(
                    icon: FontAwesomeIcons.share,
                    text: 'Share',
                  ),
                ],
              ))
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:tiktok_clone/features/videos/widgets/video_post.dart';

class VideoTimelineScreen extends StatefulWidget {
  const VideoTimelineScreen({super.key});

  @override
  State<VideoTimelineScreen> createState() => _VideoTimelineScreenState();
}

class _VideoTimelineScreenState extends State<VideoTimelineScreen> {
  final PageController _pageController = PageController();
  int _itemCount = 4;

  final scrollDuration = const Duration(milliseconds: 250);
  final scrollCurve = Curves.linear;

  void _onPageChanged(int page) {
    _pageController.animateToPage(
      page,
      duration: scrollDuration,
      curve: scrollCurve,
    );

    if (page == _itemCount - 1) {
      _itemCount += 4;
      setState(() {});
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: _pageController,
      itemCount: _itemCount,
      scrollDirection: Axis.vertical,
      onPageChanged: _onPageChanged,
      itemBuilder: (context, index) => VideoPost(
        onVideoFinished: _onVideoFinished,
      ),
    );
  }

  void _onVideoFinished() {
    _pageController.nextPage(
      duration: scrollDuration,
      curve: scrollCurve,
    );
  }
}

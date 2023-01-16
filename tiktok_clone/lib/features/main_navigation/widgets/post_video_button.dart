import 'dart:math';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/constants.dart';

class PostVideoButton extends StatefulWidget {
  const PostVideoButton({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  final Function() onPressed;

  @override
  State<PostVideoButton> createState() => _PostVideoButtonState();
}

class _PostVideoButtonState extends State<PostVideoButton>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    lowerBound: -0.02,
    upperBound: 0.02,
    duration: const Duration(milliseconds: 150),
    vsync: this,
  );

  @override
  void initState() {
    super.initState();

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        _controller.forward();
      }
    });

    _controller.value = 0;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Transform.rotate(
          angle: _controller.value * pi,
          child: child,
        );
      },
      child: GestureDetector(
        onTap: widget.onPressed,
        onLongPressDown: (details) {
          _controller.forward();
        },
        onLongPressUp: () {
          _controller.value = 0;
          _controller.stop();
        },
        onLongPressCancel: () {
          _controller.value = 0;
          _controller.stop();
        },
        onLongPressEnd: (details) {
          _controller.value = 0;
          _controller.stop();
        },
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned(
              right: 20,
              child: Container(
                height: 32,
                width: 25,
                padding: const EdgeInsets.symmetric(
                  horizontal: Sizes.size8,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFF61D4F0),
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            Positioned(
              left: 20,
              child: Container(
                height: 32,
                width: 25,
                padding: const EdgeInsets.symmetric(
                  horizontal: Sizes.size8,
                ),
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: Sizes.size12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(Sizes.size6),
              ),
              height: 32,
              child: const Center(
                child: FaIcon(
                  FontAwesomeIcons.plus,
                  size: 18,
                  color: Colors.black,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

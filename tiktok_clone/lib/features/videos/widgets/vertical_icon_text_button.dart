import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/constants.dart';

class VerticalIconTextButton extends StatelessWidget {
  const VerticalIconTextButton({
    super.key,
    required this.icon,
    required this.text,
  });

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FaIcon(
          icon,
          color: Colors.white,
          size: Sizes.size32,
        ),
        Gaps.v5,
        Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:tiktok_clone_bloc/constants/constants.dart';

class FormButton extends StatelessWidget {
  const FormButton({
    super.key,
    required this.disabled,
    required this.onPressed,
    required this.text,
  });

  final String text;
  final bool disabled;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: FractionallySizedBox(
        widthFactor: 1,
        child: AnimatedContainer(
          padding: const EdgeInsets.symmetric(vertical: Sizes.size16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: disabled
                ? Colors.grey.shade300
                : Theme.of(context).primaryColor,
          ),
          duration: const Duration(milliseconds: 150),
          child: AnimatedDefaultTextStyle(
            duration: const Duration(milliseconds: 150),
            style: TextStyle(
              fontSize: Sizes.size16,
              fontWeight: FontWeight.w600,
              color: disabled ? Colors.grey.shade400 : Colors.white,
            ),
            child: Text(
              text,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}

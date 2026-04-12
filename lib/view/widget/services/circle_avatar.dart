import 'package:flutter/material.dart';
import 'package:second/core/constant/app_constants.dart';

class CircleButton extends StatelessWidget {
  final Color backgroundColor;
  final Color IconColor;
  final void Function()? onPressed;
  final IconData icon;
  const CircleButton({
    super.key,
    required this.backgroundColor,
    required this.onPressed,
    required this.icon,
    required this.IconColor,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: backgroundColor,
      child: IconButton(
        icon: Icon(icon, color: IconColor),
        onPressed: onPressed,
      ),
    );
  }
}

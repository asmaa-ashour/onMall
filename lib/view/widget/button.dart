import 'package:flutter/material.dart';
import 'package:second/core/constant/app_constants.dart';

class Button extends StatelessWidget {
  final Color backgroundColor;
  final Color textColor;
  final String title;
  final double borderRadius;
  final void Function()? onPressed;
  const Button(
      {super.key,
      required this.backgroundColor,
      required this.textColor,
      required this.title,
      this.onPressed,
      required this.borderRadius});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        padding: EdgeInsets.all(borderRadius),
        decoration: const BoxDecoration(
          color: AppColors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 10,
              color: Colors.black12,
            )
          ],
        ),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: backgroundColor,
            padding: const EdgeInsets.symmetric(vertical: 15),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          onPressed: onPressed,
          child: Text(
            title,
            style: TextStyle(fontSize: 16, color: textColor),
          ),
        ),
      ),
    );
  }
}

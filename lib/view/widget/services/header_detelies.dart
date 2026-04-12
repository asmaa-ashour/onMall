import 'package:flutter/material.dart';
import 'package:second/core/constant/app_constants.dart';
import 'package:second/core/constant/imageassets.dart';
import 'package:second/view/widget/button.dart';
import 'package:second/view/widget/services/circle_avatar.dart';

class HeaderDetials extends StatelessWidget {
  const HeaderDetials({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 260.w,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(ImageAsset.clean),
              fit: BoxFit.cover,
            ),
          ),
        ),

        // overlay
        Container(
          height: 260.w,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.black.withOpacity(0.4),
                Colors.transparent,
              ],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
            ),
          ),
        ),

        Positioned(
          top: 50.w,
          left: AppDimens.medium.w,
          child: CircleButton(
            backgroundColor: AppColors.white,
            onPressed: () {},
            icon: Icons.arrow_back,
            IconColor: AppColors.primaryPurple,
          ),
        ),
      ],
    );
  }
}

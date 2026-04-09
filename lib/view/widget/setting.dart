import 'package:flutter/material.dart';
import 'package:second/core/constant/app_constants.dart';

class RowSettingWidget extends StatelessWidget {
  final String text;
  final IconData icon;
  final void Function()? onTap;

  const RowSettingWidget({
    super.key,
    required this.text,
    required this.icon,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    double s = SizeConfig.scaleFactor.clamp(0.9, 1.2);

    return InkWell(
      borderRadius: BorderRadius.circular(AppDimens.borderRadius),
      onTap: onTap,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppDimens.large24, // بدل 30
              vertical: AppDimens.medium16, // بدل 20
            ),
            child: Row(
              children: [
                /// 🔹 Icon
                Icon(
                  icon,
                  size: AppSizes.icon * s, // ✅ responsive
                  color: AppColors.black87,
                ),

                const SizedBox(width: AppDimens.medium16),

                /// 🔹 Text
                Expanded(
                  child: Text(
                    text,
                    style: TextStyle(
                      fontSize: 16 * s, // ✅ responsive
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).textTheme.bodyLarge?.color,
                    ),
                  ),
                ),

                /// 🔹 Arrow
                Icon(
                  Icons.arrow_forward_ios,
                  size: 16 * s, // ✅ responsive
                  color: AppColors.grey,
                ),
              ],
            ),
          ),

          /// 🔹 Divider
          const Divider(
            indent: AppDimens.large24,
            endIndent: AppDimens.large24,
          ),
        ],
      ),
    );
  }
}

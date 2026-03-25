// // lib/widgets/buy_button.dart
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:second/controller/product_controller.dart';
// import 'package:second/core/constant/app_constants.dart';

// class BuyButton extends StatelessWidget {
//   const BuyButton({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: double.infinity,
//       margin: const EdgeInsets.symmetric(horizontal: AppDimens.large),
//       height: AppDimens.buttonHeight,
//       child: ElevatedButton(
//         onPressed: () => Get.find<ProductController>().buyProduct(),
//         style: ElevatedButton.styleFrom(
//           backgroundColor: AppColors.primaryPurple,
//           foregroundColor: AppColors.white,
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(AppDimens.borderRadius),
//           ),
//           elevation: 5,
//         ),
//         child: const Text(
//           'Buy Now',
//           style: AppTextStyles.buttonText,
//         ),
//       ),
//     );
//   }
// }

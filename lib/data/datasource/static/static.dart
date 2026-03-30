import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:second/data/model/floorModel.dart';
// import 'package:second/data/model/storeModel.dart';
// import 'package:second/data/model/storeModel.dart';

import '../../../core/constant/imageassets.dart';
import '../../model/onboardingmodel.dart';

List<OnBoardingModel> onBoardingList = [
  OnBoardingModel(
    title: "onboarding_title_1".tr,
    body: "onboarding_body_1".tr,
    image: ImageAsset.onBoardingImageOne,
  ),
  OnBoardingModel(
    title: "onboarding_title_2".tr,
    body: "onboarding_body_2".tr,
    image: ImageAsset.onBoardingImageTwo,
  ),
  OnBoardingModel(
    title: "onboarding_title_3".tr,
    body: "onboarding_body_3".tr,
    image: ImageAsset.onBoardingImageThree,
  ),
  // OnBoardingModel(
  //     title: "Fast Delivery",
  //     body: "Get your orders delivered quickly to your doorstep.",
  //     image: ImageAsset.onBoardingImageThree),
];

// /////////////////////////////////////////تجربة
final List<FloorModel> floors = [
  FloorModel(
    title: "Ground Floor",
    image: ImageAsset.onBoardingImageThree,
    stores: [
      // StoresModel(name: "Store A", image: ImageAsset.onBoardingImageTwo),
      // StoresModel(name: "Store B", image: ImageAsset.onBoardingImageOne),
      // StoresModel(name: "Store C", image: ImageAsset.onBoardingImageOne),
      // StoresModel(name: "Store D", image: ImageAsset.onBoardingImageOne),
      // StoresModel(name: "Store E", image: ImageAsset.onBoardingImageOne),
    ],
  ),
  FloorModel(
    title: "First Floor",
    image: ImageAsset.onBoardingImageOne,
    // إذا ما في متاجر → رح يكون default empty list
  ),
  FloorModel(
    title: "Second Floor",
    image: ImageAsset.onBoardingImageTwo,
    // إذا ما في متاجر → رح يكون default empty list
  ),
  FloorModel(
    title: "Third Floor",
    image: ImageAsset.onBoardingImageOne,
    // إذا ما في متاجر → رح يكون default empty list
  ),
];
// ///////////////////////////////////
// Map<String, List<StoreModel>> floorStores = {
//   "Ground Floor": [
//     StoreModel(
//       name: "Starbucks",
//       image: ImageAsset.onBoardingImageThree,
//     ),
//     StoreModel(
//       name: "McDonald's",
//       image: ImageAsset.onBoardingImageOne,
//     ),
//   ],
//   "First Floor": [
//     StoreModel(
//       name: "Zara",
//       image: ImageAsset.onBoardingImageTwo,
//     ),
//     StoreModel(
//       name: "H&M",
//       image: ImageAsset.onBoardingImageThree,
//     ),
//   ],
// };

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:second/data/model/floorModel.dart';
import 'package:second/data/model/service_areas_model.dart';
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
      // OnBoardingModel(
      //     title: "Fast Delivery",
      //     body: "Get your orders delivered quickly to your doorstep.",
      image: ImageAsset.onBoardingImageThree),
];

List<Service> services = [
  Service(
    name: "Hair Styling",
    providerName: "Beauty Salon",
    price: 25,
    rating: 4.7,
    isFavorite: true,
    image: "assets/images/f1.jpg",
  ),
  Service(
    name: "Car Wash",
    providerName: "Clean Center",
    price: 10,
    rating: 4.3,
    isFavorite: false,
    image: "assets/images/f2.jpg",
  ),
  Service(
    name: "Makeup",
    providerName: "Glam Studio",
    price: 40,
    rating: 4.9,
    isFavorite: true,
    image: "assets/images/f3.jpg",
  ),
];

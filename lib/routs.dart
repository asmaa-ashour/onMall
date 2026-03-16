import 'package:flutter/widgets.dart';
import 'package:second/core/constant/routs.dart';
import 'package:second/view/screen/HomePage.dart';
import 'package:second/view/screen/login.dart';
import 'package:second/view/screen/onBoarding.dart';
import 'package:second/view/screen/product_screen.dart';
import 'package:second/view/screen/signUp.dart';
import 'package:second/view/screen/splash.dart';

class AppPages {
  static const initial = '/logo';

  static final Map<String, Widget Function(BuildContext)> routes = {
    AppRoute.logIn: (context) => const SignInScreen(),
    AppRoute.signUp: (context) => const SignUpScreen(),
    AppRoute.logo: (context) => const LogoPge(),
    AppRoute.onBoarding: (context) => const OnBoardingScreen(),
    AppRoute.productScreen: (context) => const ProductScreen(),
    AppRoute.home: (context) => Homepage(),
    //   AppRoute.verfiyCode: (context) => const VerfiyCodeSignUp(),
    //   AppRoute.successSignUp: (context) => const SuccessSignUp(),
    //   AppRoute.home: (context) => const HomePagee(),
  };
}

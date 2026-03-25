import 'package:flutter/widgets.dart';
import 'package:second/core/constant/routs.dart';
import 'package:second/view/screen/home/HomePage.dart';
import 'package:second/view/screen/home/areaScreen.dart';
import 'package:second/view/screen/home/mainNavigationScreen%20.dart';
import 'package:second/view/screen/login.dart';
import 'package:second/view/screen/onBoarding.dart';
import 'package:second/view/screen/products_screen.dart';
import 'package:second/view/screen/signUp.dart';
import 'package:second/view/screen/splash.dart';
import 'package:second/view/screen/test/category_screen.dart';

class AppPages {
  static const initial = '/logo';

  static final Map<String, Widget Function(BuildContext)> routes = {
    AppRoute.logIn: (context) => const SignInScreen(),
    AppRoute.signUp: (context) => const SignUpScreen(),
    AppRoute.logo: (context) => const LogoPge(),
    AppRoute.onBoarding: (context) => const OnBoardingScreen(),
    AppRoute.productScreen: (context) => const ProductsScreen(),
    AppRoute.home: (context) => MainNavigationScreen(),
    AppRoute.mainHomePage: (context) => MainNavigationScreen(),
    AppRoute.area: (context) => AreaScreen(),
    AppRoute.test: (context) => CategoriesPage(),
    //   AppRoute.verfiyCode: (context) => const VerfiyCodeSignUp(),
    //   AppRoute.successSignUp: (context) => const SuccessSignUp(),
    //   AppRoute.home: (context) => const HomePagee(),
  };
}

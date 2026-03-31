import 'package:flutter/widgets.dart';
import 'package:second/core/constant/routs.dart';
import 'package:second/view/screen/home/mainNavigationScreen%20.dart';
import 'package:second/view/screen/auth/login.dart';
import 'package:second/view/screen/language.dart';
import 'package:second/view/screen/onBoarding.dart';
import 'package:second/view/screen/auth/signUp.dart';
import 'package:second/view/screen/splash.dart';
import 'package:second/view/screen/test/area_screen.dart';

class AppPages {
  static const initial = '/logo';

  static final Map<String, Widget Function(BuildContext)> routes = {
    AppRoute.logIn: (context) => const SignInScreen(),
    AppRoute.signUp: (context) => const SignUpScreen(),
    AppRoute.logo: (context) => const LogoPge(),
    AppRoute.onBoarding: (context) => const OnBoardingScreen(),
    AppRoute.home: (context) => MainNavigationScreen(),
    AppRoute.mainHomePage: (context) => MainNavigationScreen(),
<<<<<<< HEAD
    AppRoute.area: (context) => AreasPage(),
    AppRoute.lang: (context) => Language(),
    // AppRoute.product: (context) => ProductsPage(areaId: '',),

    //AppRoute.test: (context) => AreasPage(),
    //   AppRoute.verfiyCode: (context) => const VerfiyCodeSignUp(),
    //   AppRoute.successSignUp: (context) => const SuccessSignUp(),
    //   AppRoute.home: (context) => const HomePagee(),
=======
    AppRoute.area: (context) => const AreasPage(),
    AppRoute.lang: (context) => const Language(),
>>>>>>> origin/feature/store_and_product
  };
}

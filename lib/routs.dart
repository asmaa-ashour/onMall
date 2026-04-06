import 'package:flutter/widgets.dart';
import 'package:second/core/constant/routs.dart';
import 'package:second/view/notification.dart';
import 'package:second/view/screen/ProfilePage.dart';
import 'package:second/view/screen/edit_personal_profile.dart';
import 'package:second/view/screen/home/mainNavigationScreen%20.dart';
import 'package:second/view/screen/auth/login.dart';
import 'package:second/view/screen/language.dart';
import 'package:second/view/screen/onBoarding.dart';
import 'package:second/view/screen/auth/signUp.dart';
import 'package:second/view/screen/pay_screen.dart';
import 'package:second/view/screen/services_and_stores/services_screen.dart';
import 'package:second/view/screen/setting.dart';
import 'package:second/view/screen/splash.dart';

class AppPages {
  static const initial = '/logo';

  static final Map<String, Widget Function(BuildContext)> routes = {
    AppRoute.logIn: (context) => const SignInScreen(),
    AppRoute.signUp: (context) => const SignUpScreen(),
    AppRoute.logo: (context) => const LogoPge(),
    AppRoute.onBoarding: (context) => const OnBoardingScreen(),
    AppRoute.home: (context) => MainNavigationScreen(),
    AppRoute.mainHomePage: (context) => MainNavigationScreen(),
    // AppRoute.area: (context) => const AreasPage(),
    AppRoute.lang: (context) => const Language(),
    AppRoute.setting: (context) => const Setting(),
    AppRoute.personalProfile: (context) => const ProfilePage(),
    AppRoute.notification: (context) => const ServicesScreen(),
    //const NotificationScreen(),
    AppRoute.editPersonalProfile: (context) => const EditPersonalProfile(),
    AppRoute.chargingbalance: (context) => const PayScreen(),
  };
}

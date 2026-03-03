import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_project/core/resources/app_theme.dart';
import 'package:movies_project/core/resources/routes_manager.dart';
import 'package:movies_project/features/auth/presentation/screen/login_screen.dart';
import 'package:movies_project/features/home%20screen/home_screen.dart';
import 'package:movies_project/features/onboarding/presentation/screen/onboarding_screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(EasyLocalization(
      supportedLocales: [
        Locale("en"),
        Locale("ar"),
      ], path: 'assets/translations',
      fallbackLocale: Locale("en"),
      startLocale: Locale("en"),
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      builder :(context, child) =>  MaterialApp(
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        theme: AppTheme.darkTheme,
        debugShowCheckedModeBanner: false,
        initialRoute: RoutesManager.onBoardingRoute,
        routes: {
          RoutesManager.homeRoute:(_)=>HomeScreen(),
          RoutesManager.onBoardingRoute:(_)=>OnboardingScreen(),
          RoutesManager.loginsRoute:(_)=>LoginScreen()
        },
      ),
    );
  }
}

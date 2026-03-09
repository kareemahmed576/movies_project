import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_project/core/resources/app_theme.dart';
import 'package:movies_project/core/resources/routes_manager.dart';
import 'package:movies_project/features/auth/sign_up_screen/presentation/screen/signup_screen.dart';
import 'package:movies_project/features/home%20screen/home_screen.dart';
import 'package:movies_project/features/home%20screen/profile%20tab/Cubit/profile_cubit.dart';
import 'package:movies_project/features/movie%20details/presentation/screen/movie_details_screen.dart';
import 'package:movies_project/features/onboarding/presentation/screen/onboarding_screen.dart';
import 'features/auth/forget_password_screen/forget_password_screen.dart';
import 'core/DI/di.dart';
import 'features/home screen/profile tab/model/movieModel.dart';
import 'features/auth/login screen/presentation/screen/login_screen.dart';
// import 'firebase_options.dart';
import 'features/update_profile/Cubit/selected_avatar_cubit.dart';
import 'features/update_profile/update_profile.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    // options: DefaultFirebaseOptions.currentPlatform,
  );
  configureDependencies();
  await EasyLocalization.ensureInitialized();
  runApp(EasyLocalization(
      supportedLocales: const [Locale("en"), Locale("ar")],
      path: 'assets/translations',
      fallbackLocale: const Locale("en"),
      startLocale: const Locale("en"),
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
      builder: (context, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(create: (context) => SelectedAvatarCubit()),
          ],
          child: MaterialApp(
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            themeMode: ThemeMode.dark,
            theme: AppTheme.darkTheme,
            debugShowCheckedModeBanner: false,
            onGenerateRoute: (settings) => _generateRoute(settings),
            initialRoute: RoutesManager.homeRoute,
          ),
        );
      },
    );
  }

  Route<dynamic>? _generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesManager.homeRoute:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => ProfileCubit(),
            child:  HomeScreen(),
          ),
        );

      case RoutesManager.movieDetailsRoute:
        final movie = settings.arguments;
        if (movie is MovieModel) {
          return MaterialPageRoute(
            builder: (_) => MovieDetailsScreen(movie),
          );
        }
        return _errorRoute();

      case RoutesManager.onBoardingRoute:
        return MaterialPageRoute(builder: (_) => OnboardingScreen());
      case RoutesManager.loginsRoute:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case RoutesManager.signupRoute:
        return MaterialPageRoute(builder: (_) => SignupScreen());
      case RoutesManager.updateProfileRoute:
        return MaterialPageRoute(
          builder: (_) => const UpdateProfile(),
        );
        case RoutesManager.forgetPasswordRoute:
        return MaterialPageRoute(
          builder: (_) => const ForgetPasswordScreen(),
        );
      default:
        return _errorRoute();
    }
  }

  Route<dynamic> _errorRoute() {
    return MaterialPageRoute(
      builder: (_) => const Scaffold(
        body: Center(child: Text('Route not found')),
      ),
    );
  }
}

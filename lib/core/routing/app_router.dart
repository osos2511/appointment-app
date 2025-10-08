import 'package:appoinment_app/core/di/dependency_injection.dart';
import 'package:appoinment_app/core/routing/routes.dart';
import 'package:appoinment_app/features/home/ui/home_screen.dart';
import 'package:appoinment_app/features/login/logic/login_cubit.dart';
import 'package:appoinment_app/features/login/ui/login_screen.dart';
import 'package:appoinment_app/features/onboarding/onboarding_screen.dart';
import 'package:appoinment_app/features/sign_up/ui/sign_up_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter{
  Route generateRoute(RouteSettings settings){
    //this arguments to be passed in any screen like this (arguments as ClassName)
    final arguments=settings.arguments;
    switch(settings.name) {
      case Routes.onBoardingScreen:
        return MaterialPageRoute(builder: (context) => OnboardingScreen());
        case Routes.loginScreen:
        return MaterialPageRoute(builder: (context) => BlocProvider(
            create: (context) => getIt<LoginCubit>(),
            child: LoginScreen()));
        case Routes.signUpScreen:
        return MaterialPageRoute(builder: (context) => SignUpScreen());
        case Routes.homeScreen:
        return MaterialPageRoute(builder: (context) => HomeScreen());

      default:
        return MaterialPageRoute(builder: (context) =>
            Scaffold(
              body: Center(
                child: Text('No route defined for ${settings.name}'),),
            ),);
    }
  }
}
import 'package:bank_mobile_app/features/auth/ui/screens/sign_in_screen.dart';
import 'package:bank_mobile_app/features/auth/ui/screens/sign_up_screen.dart';
import 'package:bank_mobile_app/features/home/ui/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AppRoutes{
  static Route<dynamic> onGenerateRouteSetting(RouteSettings settings){
    late Widget route;
    if(settings.name==SignInScreen.name){
      route=const SignInScreen();
    }
    else if(settings.name==SignUpScreen.name){
      route= const SignUpScreen();
    }
    else if(settings.name==HomeScreen.name){
      route=const HomeScreen();
    }
    
    return MaterialPageRoute(builder: (_)=> route);
  }
}
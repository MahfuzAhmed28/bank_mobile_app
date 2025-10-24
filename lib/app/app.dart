import 'package:bank_mobile_app/app/app_routes.dart';
import 'package:bank_mobile_app/app/theme_data.dart';
import 'package:flutter/material.dart';

class MobileBankingApp extends StatelessWidget {
  const MobileBankingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      onGenerateRoute: AppRoutes.onGenerateRouteSetting,
      theme: appThemeData,
    );
  }
}

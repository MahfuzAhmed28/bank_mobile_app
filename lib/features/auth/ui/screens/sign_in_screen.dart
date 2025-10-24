import 'package:bank_mobile_app/app/app_colors.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  static const String name='/';

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: double.maxFinite,
            decoration: BoxDecoration(
              color: AppColors.themeColor
            ),
            child: Column(
              children: [
                SizedBox(height: 100,),
                Text('WELCOME!',style: TextStyle(
                  fontSize: 30,
                  color: Colors.white
                ),),
                SizedBox(height: 40,),
                Icon(Icons.account_balance,size: 200,color: Colors.white,),
                SizedBox(height: 40,),
              ],
            ),
          ),
          Container()
        ],
      ),
    );
  }
}

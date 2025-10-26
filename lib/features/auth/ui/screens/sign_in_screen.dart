import 'package:bank_mobile_app/app/app_colors.dart';
import 'package:bank_mobile_app/features/auth/ui/screens/sign_up_screen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  static const String name='/sign-in-screen';

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {

  final TextEditingController _usernameOrEmailTEController=TextEditingController();
  final TextEditingController _passwordTEController=TextEditingController();
  final GlobalKey<FormState> _formKey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
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
              _signInFormSection()
            ],
          ),
        ),
      ),
    );
  }

  Widget _signInFormSection() {
    return Container(
      child: Padding(
        padding: EdgeInsets.all(30),
        child: Column(
          children: [
            TextFormField(
              controller: _usernameOrEmailTEController,
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                hintText: 'Username or Password'
              ),
              validator: (String? value){
                if(value?.trim().isEmpty ?? true){
                  return 'Enter username or password';
                }
                return null;
              },
            ),
            SizedBox(height: 15,),
            TextFormField(
              controller: _passwordTEController,
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                hintText: 'Password',
              ),
              validator: (String? value){
                if(value?.isEmpty ?? true){
                  return 'Enter your password';
                }
                return null;
              },
            ),
            SizedBox(height: 20,),
            ElevatedButton(
              onPressed: _onTapSignInButton,
              child: Text('Log In',style: TextStyle(fontWeight: FontWeight.bold),),
              style: ElevatedButton.styleFrom(
                fixedSize: Size(150, 45),
              ),
            ),
            SizedBox(height: 30,),
            GestureDetector(
              onTap: (){},
              child: Text(
                'Forgot Password?',
                 style: TextStyle(
                   fontSize: 18,
                   fontWeight: FontWeight.bold,
                   color: Color(0xFF94c9da),
                   decoration: TextDecoration.underline,
                   decorationColor: Color(0xFF94c9da),
                 ),
              ),
            ),
            SizedBox(height: 10,),
            RichText(
              text: TextSpan(
                text: 'New to Bank Apps? ',
                style: TextStyle(
                  color: Color(0xFF606060),
                  fontSize: 18,
                ),
                children: [
                  TextSpan(
                    text: 'Sign Up',
                    style: TextStyle(
                      fontSize: 18,
                      color: Color(0xFF94c9da),
                      decoration: TextDecoration.underline,
                      decorationColor: Color(0xFF94c9da),
                    ),
                    recognizer: TapGestureRecognizer()..onTap=_onTapSignUpButton,
                  )
                ]
              ),
            )
          ],
        ),
      ),
    );
  }

  void _onTapSignInButton(){
    if(_formKey.currentState!.validate()){

    }
  }
  void _onTapSignUpButton(){
    Navigator.pushReplacementNamed(context, SignUpScreen.name);
  }
}

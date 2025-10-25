import 'package:bank_mobile_app/app/app_colors.dart';
import 'package:bank_mobile_app/features/auth/ui/screens/sign_in_screen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  static const String name='/sign-up-screen';

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  final TextEditingController _nameTEController=TextEditingController();
  final TextEditingController _bankAccountTEController=TextEditingController();
  final TextEditingController _emailTEController=TextEditingController();
  final TextEditingController _passwordTEController=TextEditingController();
  final GlobalKey<FormState> _formKey=GlobalKey<FormState>();

  bool isChecked=false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          top: false,
          child: Column(
            children: [
              _topSection(),
              _signUpFormSection(),
              _bottomSection()
            ],
          ),
        ),
      ),
    );
  }

  Widget _topSection() {
    return Container(
      height: 250,
      width: double.maxFinite,
      decoration: BoxDecoration(
        color: AppColors.themeColor
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50),
        child: Column(
          children: [
            SizedBox(height: 100,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.account_balance,color: Colors.white,size: 80,),
                Icon(Icons.link_outlined,color: Colors.white,size: 80,),
                Icon(Icons.phone_android,color: Colors.white,size: 80,),
              ],
            ),
            SizedBox(height: 20,),
            Text(
              'Connect to your bank account',
               style: TextStyle(
                 fontSize: 20,
                 color: Colors.white,
                 fontWeight: FontWeight.w600
               ),
            )
          ],
        ),
      ),
    );
  }

  Widget _bottomSection() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 40),
      child: RichText(
        text: TextSpan(
          text: 'Already Signed Up? ',
          style: TextStyle(
            color: Colors.grey.shade600,
            fontSize: 18
          ),
          children: [
            TextSpan(
              text: 'Sign In',
              style: TextStyle(
                color: Color(0xFF94c9da),
                fontSize: 18,
                decoration: TextDecoration.underline,
                decorationColor: Color(0xFF94c9da),
              ),
              recognizer: TapGestureRecognizer()..onTap=_onTapSignInButton
            )
          ]
        ),
      ),
    );
  }

  Widget _signUpFormSection() {
    return Padding(
      padding: EdgeInsets.all(30),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              controller: _nameTEController,
              decoration: InputDecoration(
                hintText: 'Your Name'
              ),
              validator: (String? value){
                if(value?.trim().isEmpty ?? true){
                  return 'Enter your name';
                }
                return null;
              },
            ),
            SizedBox(height: 15,),
            TextFormField(
              controller: _bankAccountTEController,
              decoration: InputDecoration(
                  hintText: 'Bank Account'
              ),
              validator: (String? value){
                if(value?.trim().isEmpty ?? true){
                  return 'Enter your bank account';
                }
                return null;
              },
            ),
            SizedBox(height: 15,),
            TextFormField(
              controller: _emailTEController,
              decoration: InputDecoration(
                  hintText: 'Email'
              ),
              validator: (String? value){
                if(value?.trim().isEmpty ?? true){
                  return 'Enter your email';
                }
                return null;
              },
            ),
            SizedBox(height: 15,),
            TextFormField(
              controller: _passwordTEController,
              decoration: InputDecoration(
                  hintText: 'Password'
              ),
              validator: (String? value){
                if(value?.trim().isEmpty ?? true){
                  return 'Enter your password';
                }
                return null;
              },
            ),
            SizedBox(height: 15,),
            Text(
              'Use 6 characters with a mix of letters, numbers & symbols',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Color(0xFF3895D3),
              ),
            ),
            SizedBox(height: 10,),
            CheckboxListTile(
              contentPadding: EdgeInsets.zero,
              value: isChecked,
              onChanged: (value){
                setState(() {
                  isChecked= value ?? false;
                });
              },
              controlAffinity: ListTileControlAffinity.leading,
              title: Text(
                "By signing up, you agree to Bank\'s Term of Use & Privacy Policy.",
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.grey.shade600
                ),
              ),
              activeColor: AppColors.themeColor,

            ),
            SizedBox(height: 15,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: _onTapSignUpButton,
                    child: Text('SIGN UP'),
                  ),
                ),
                SizedBox(width: 10,),
                Text('Or'),
                SizedBox(width: 10,),
                Expanded(
                  child: ElevatedButton(
                    onPressed: (){},
                    child: Text('CANCEL'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: AppColors.themeColor,
                      side: BorderSide(
                        color: AppColors.themeColor,
                        width: 2
                      )
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }




  void _onTapSignUpButton(){
    if(_formKey.currentState!.validate()){

    }
  }

  void _onTapSignInButton(){
    Navigator.pushReplacementNamed(context, SignInScreen.name);
  }
}

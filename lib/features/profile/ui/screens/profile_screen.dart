import 'package:bank_mobile_app/app/app_colors.dart';
import 'package:bank_mobile_app/features/common/ui/widgets/drawer_widget.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  static const String name='/profile-screen';

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  final TextEditingController _nameTEController=TextEditingController();
  final TextEditingController _bankAccountTEController=TextEditingController();
  final TextEditingController _emailTEController=TextEditingController();
  final TextEditingController _passwordTEController=TextEditingController();
  final TextEditingController _phoneNumberTEController=TextEditingController();
  final TextEditingController _addressTEController=TextEditingController();

  final GlobalKey<FormState> _formKey=GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerWidget(),
      appBar: _profileAppbar(context),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SafeArea(
            child: Form(
              key: _formKey,
              child: _saveChangesFormField(),
            ),
          ),
        ),
      ),
    );
  }

  Column _saveChangesFormField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(child: Icon(Icons.account_circle,color: AppColors.themeColor,size: 100,)),
        SizedBox(height: 15,),
        Text(
          'YOUR NAME',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.black54
          ),
        ),
        TextFormField(
          controller: _nameTEController,
          decoration: InputDecoration(
            hintText: 'MAHFUZ AHMED'
          ),
          validator: (String? value){
            if(value?.trim().isEmpty ?? true){
              return 'Enter your name';
            }
            return null;
          },
        ),
        SizedBox(height: 10,),
        Text(
          'BANK ACCOUNT',
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Colors.black54
          ),
        ),
        TextFormField(
          controller: _bankAccountTEController,
          decoration: InputDecoration(
              hintText: '00012  34567'
          ),
          validator: (String? value){
            if(value?.trim().isEmpty ?? true){
              return 'Enter your bank account';
            }
            return null;
          },
        ),
        SizedBox(height: 10,),
        Text(
          'EMAIL',
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Colors.black54
          ),
        ),
        TextFormField(
          controller: _emailTEController,
          decoration: InputDecoration(
              hintText: 'mahfuz@gmail.om'
          ),
          validator: (String? value){
            if(value?.trim().isEmpty ?? true){
              return 'Enter your email';
            }
            return null;
          },
        ),
        SizedBox(height: 10,),
        Text(
          'PASSWORD',
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Colors.black54
          ),
        ),
        TextFormField(
          controller: _passwordTEController,
          decoration: InputDecoration(
              hintText: '*******'
          ),
          validator: (String? value){
            if(value?.isEmpty ?? true){
              return 'Enter your password';
            }
            return null;
          },
        ),
        SizedBox(height: 10,),
        Text(
          'PHONE NUMBER',
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Colors.black54
          ),
        ),
        TextFormField(
          controller: _phoneNumberTEController,
          decoration: InputDecoration(
              hintText: '01234567890'
          ),
          validator: (String? value){
            if(value?.trim().isEmpty ?? true){
              return 'Enter your phone number';
            }
            return null;
          },
        ),
        SizedBox(height: 10,),
        Text(
          'ADDRESS',
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Colors.black54
          ),
        ),
        TextFormField(
          controller: _addressTEController,
          maxLines: 3,
          decoration: InputDecoration(
              hintText: 'Sector-10; Uttara; Dhaka'
          ),
          validator: (String? value){
            if(value?.trim().isEmpty ?? true){
              return 'Enter your address';
            }
            return null;
          },
        ),
        SizedBox(height: 20,),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Text(
            '* Nunc faucibus a pallentesque sit amet porrittor eget dolor morbi non.',
            style: TextStyle(
              color: Colors.grey.shade600,
              fontWeight: FontWeight.w600
            ),
          ),
        ),
        SizedBox(height: 10,),
        Center(
          child: ElevatedButton(
            onPressed: _onTapSaveChangesButton,
            child: Text(
              'SAVE CHANGES',
              style: TextStyle(
                fontWeight: FontWeight.w600
              ),
            ),
          ),
        )

      ],
    );
  }

  AppBar _profileAppbar(BuildContext context) {
    return AppBar(
      iconTheme: IconThemeData(
        color: Colors.white,
        size: 35,
      ),
      backgroundColor: AppColors.themeColor,
      title: Row(
        children: [
          IconButton(
            onPressed: (){
              Navigator.pop(context);
            },
            icon: Icon(Icons.chevron_left,color: Colors.white,size: 45,),
          ),
          SizedBox(width: 8,),
          Text(
            'ACCOUNT',
            style: TextStyle(
              color: Colors.white
            ),
          )
        ],
      ),
      actions: [
        IconButton(
          onPressed: (){},
          icon: Icon(Icons.settings),
        )
      ],
    );
  }

  void _onTapSaveChangesButton(){
    if(_formKey.currentState!.validate()){

    }
  }
}

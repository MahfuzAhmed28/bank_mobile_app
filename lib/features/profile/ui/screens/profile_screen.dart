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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerWidget(),
      appBar: AppBar(
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
      ),
    );
  }
}

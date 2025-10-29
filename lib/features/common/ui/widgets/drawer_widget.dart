import 'package:bank_mobile_app/features/add_card/ui/screens/add_card_screen.dart';
import 'package:bank_mobile_app/features/home/ui/screens/home_screen.dart';
import 'package:bank_mobile_app/features/profile/ui/screens/profile_screen.dart';
import 'package:flutter/material.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
                color: Colors.blue
            ),
            child: Text(
              'Menu',
              style: TextStyle(
                  fontSize: 24,
                  color: Colors.white
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            onTap: (){
              Navigator.pop(context);
              Navigator.pushReplacementNamed(context, HomeScreen.name);

            },
          ),
          ListTile(
            leading: Icon(Icons.account_circle_outlined),
            title: Text('Profile'),
            onTap: (){
              Navigator.pop(context);
              Navigator.pushNamed(context, ProfileScreen.name);
            },
          ),
          ListTile(
            leading: Icon(Icons.credit_card),
            title: Text('Add Card'),
            onTap: (){
              Navigator.pop(context);
              Navigator.pushNamed(context, AddCardScreen.name);
            },
          ),
        ],
      ),
    );
  }
}

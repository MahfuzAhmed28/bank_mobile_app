import 'package:bank_mobile_app/app/app_colors.dart';
import 'package:bank_mobile_app/features/common/ui/widgets/drawer_widget.dart';
import 'package:bank_mobile_app/features/home/ui/widgets/transaction_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static const String name='/';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
        actions: [
          IconButton(
            onPressed: (){}, 
            icon: Icon(Icons.settings),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _topSection(),
            SizedBox(height: 10,),
            Text(
              'LATEST TRANSACTIONS',
              style: TextStyle(
                color: Color(0xFF3895D3),
                fontSize: 18,
                fontWeight: FontWeight.w600
              ),
            ),
            SizedBox(height: 16,),
            _transactionListSection()
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        child: Text(
          'More>>',
          style: TextStyle(
            color: AppColors.themeColor,
            fontWeight: FontWeight.bold,
            fontSize: 15
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
    );
  }

  Widget _transactionListSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: 10,
        itemBuilder: (context,index){
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: TransactionWidget(),
          );
        },
      ),
    );
  }

  Widget _topSection() {
    return Container(
      width: double.maxFinite,
      decoration: BoxDecoration(
        color: AppColors.themeColor,
      ),
      child: Column(
        children: [
          Icon(Icons.account_circle,size: 120,color: Colors.white,),
          Text(
            'MAHFUZ AHMED',
            style: TextStyle(
              fontSize: 25,
              color: Colors.white,
              fontWeight: FontWeight.w600
            ),
          ),
          Text(
            'mahfuz@gmail.com',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8,left: 40,right: 40,bottom: 25),
            child: Container(
              width: double.maxFinite,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20)
              ),
              child: Column(
                children: [
                  Text(
                    'BALANCE',
                    style: TextStyle(
                      color: Color(0xFF3895D3),
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    '\$ 4111.65',
                    style: TextStyle(
                      color: AppColors.themeColor,
                      fontSize: 30,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  ElevatedButton(
                    onPressed: (){}, child: Text('TRANSFER'),
                  ),
                  SizedBox(height: 10,)
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

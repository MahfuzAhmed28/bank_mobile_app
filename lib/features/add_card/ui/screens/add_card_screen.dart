import 'package:bank_mobile_app/app/app_colors.dart';
import 'package:bank_mobile_app/features/common/ui/widgets/drawer_widget.dart';
import 'package:flutter/material.dart';

class AddCardScreen extends StatefulWidget {
  const AddCardScreen({super.key});

  static const String name='/add-card-screen';

  @override
  State<AddCardScreen> createState() => _AddCardScreenState();
}

class _AddCardScreenState extends State<AddCardScreen> {
  final TextEditingController _nameTEController =TextEditingController();
  final TextEditingController _cardNumberTEController =TextEditingController();
  final TextEditingController _passwordTEController =TextEditingController();
  final TextEditingController _phoneNumberTEController =TextEditingController();
  final GlobalKey<FormState> _formKey=GlobalKey<FormState>();


  int? _selectedDay;
  int? _selectedMonth;
  int? _selectedYear;
  String? _selectCountryCode;

  final List<int> _days=List.generate(31, (index)=>index+1);
  final List<int> _months=List.generate(12, (index)=>index+1);
  final List<int> _years=List.generate(61, (index)=>1975+index);
  final List<Map<String,String>> _phoneNumberCountryCode=[
    {'name': 'Bangladesh', 'code': '+880'},
    {'name': 'United States', 'code': '+1'},
    {'name': 'India', 'code': '+91'},
    {'name': 'United Kingdom', 'code': '+44'},
    {'name': 'Canada', 'code': '+1'},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerWidget(),
      appBar: _addCardAppbar(context),
      body: SingleChildScrollView(
        child: SafeArea(
          child: _addCardFormSection(),
        ),
      ),
    );
  }

  Widget _addCardFormSection() {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.only(top: 10,bottom: 30,right: 30,left: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.asset(
                'assets/images/bank_card2.JPG',
                width: 200,
                height: 200,
              ),
            ),
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
                hintText: 'NAME',
                contentPadding: EdgeInsets.symmetric(vertical: 0,horizontal: 10)
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
              'CARD NUMBER',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.black54
              ),
            ),
            TextFormField(
              controller: _cardNumberTEController,
              decoration: InputDecoration(
                  hintText: 'INSERT YOUR CARD NUMBER',
                  contentPadding: EdgeInsets.symmetric(vertical: 0,horizontal: 10)
              ),
              validator: (String? value){
                if(value?.trim().isEmpty ?? true){
                  return 'Enter your card number';
                }
                return null;
              },
            ),
            SizedBox(height: 10,),
            Text(
              'EXPIRED DATE',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.black54
              ),
            ),
            _expiredDateSubSection(),
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
                  hintText: '********',
                  contentPadding: EdgeInsets.symmetric(vertical: 0,horizontal: 10)
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
            Row(
              children: [
                SizedBox(
                  width: 100,
                  child: DropdownButtonFormField(
                    decoration: InputDecoration(
                      hintText: '+880',
                      contentPadding: EdgeInsets.symmetric(horizontal: 10,vertical: 0)
                    ),
                    value: _selectCountryCode,
                    items: _phoneNumberCountryCode.map((country)=>DropdownMenuItem(value: country['code'],child: Text('${country['code']} '))).toList(),
                    onChanged: (value) => setState(() => _selectCountryCode=value),
                    validator: (value){
                      if(value==null){
                        return 'Select the country';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(width: 5,),
                Expanded(
                  child: TextFormField(
                    controller: _phoneNumberTEController,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(horizontal: 10,vertical: 0)
                    ),
                    validator: (String? value){
                      if(value?.trim().isEmpty ?? true){
                        return 'Enter the phone number';
                      }
                      return null;
                    },
                  ),
                )
              ],
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
            SizedBox(height: 20,),
            Center(
              child: ElevatedButton(
                onPressed: _onTapLinkCardButton,
                child: Text('LINK CARD'),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _expiredDateSubSection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: 80,
          child: DropdownButtonFormField<int>(
            decoration: InputDecoration(
              hintText: 'DAY',
              contentPadding: EdgeInsets.symmetric(horizontal: 10,vertical: 0)
            ),
            value: _selectedDay,
            items: _days.map((day) => DropdownMenuItem(value:day,child:Text('$day'))).toList(),
            onChanged: (value) => setState(() => _selectedDay=value),
            validator: (value){
              if(value==null){
                return 'Enter the day';
              }
              return null;
            }
          ),
        ),
        SizedBox(width: 5,),
        SizedBox(
          width: 105,
          child: DropdownButtonFormField<int>(
            decoration: InputDecoration(
              hintText: 'MONTH',
              contentPadding: EdgeInsets.symmetric(horizontal: 10,vertical: 0)
            ),
            value: _selectedMonth,
            items: _months.map((month) => DropdownMenuItem(value:month,child:Text('$month'))).toList(),
            onChanged: (value) => setState(() => _selectedMonth=value),
              validator: (value){
                if(value==null){
                  return 'Enter the month';
                }
                return null;
              }
          ),
        ),
        SizedBox(width: 5,),
        Expanded(
          child: DropdownButtonFormField<int>(
            decoration: InputDecoration(
              hintText: 'YEAR',
              contentPadding: EdgeInsets.symmetric(horizontal: 10,vertical: 0)
            ),
            value: _selectedYear,
            items: _years.map((year) => DropdownMenuItem(value:year,child:Text('$year'))).toList(),
            onChanged: (value) => setState(() => _selectedYear=value),
              validator: (value){
                if(value==null){
                  return 'Enter the year';
                }
                return null;
              }
          ),
        ),
      ],
    );
  }

  AppBar _addCardAppbar(BuildContext context) {
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
            'ADD CARD',
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

  void _onTapLinkCardButton(){
    if(_formKey.currentState!.validate()){

    }
  }
}

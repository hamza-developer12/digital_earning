import 'package:digital_earning/constants/constants.dart';
import 'package:digital_earning/layouts/default_user_page_layout.dart';
import 'package:digital_earning/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({super.key});

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    Provider.of<UserProvider>(context, listen: false).getUserInfo(context);
  }
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return DefaultUserPageLayout(
        backgroundColor: Colors.white,
        appBarBackgroundColor: Constants.color1,
        icon: Icons.person,
        screenName: "Profile",
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Consumer<UserProvider>(
            builder: (context, value, child) {
              if(value.loading) {
                return Center(
                  child: CircularProgressIndicator(color: Constants.color1,),
                );
              }else if(value.userData.isEmpty) {
                return Center(
                  child: Text("No Record Found"),
                );
              }else {
                Map<String,dynamic> info = value.userData;
                return  Column(
                  children: [
                    SizedBox(height: height * 0.04),
                    customRow("Name", info['name']),
                    customRow("Email", info['email']),
                    customRow("Date Of Birth", info['birth']),
                    customRow("Gender", info['gender']),
                    customRow("Phone Number", info['phoneNumber']),
                    customRow("WhatsApp Number", info['whatsAppNumber']),
                    customRow("CNIC Number", info['cnic']),
                    customRow("Promo ID", info['promoId']),
                  ],
                );
              }
            },
          ),
          // child:
        ),
    );
  }
  
  Widget customRow(String title, String value) {
    final height = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title),
              Text(value)
            ],
          ),
          SizedBox(height: height * 0.01),
          Container(
            width: 383,
            decoration: const ShapeDecoration(
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  width: 1,
                  strokeAlign: BorderSide.strokeAlignCenter,
                  color: Constants.color1,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

import 'package:digital_earning/constants/constants.dart';
import 'package:digital_earning/layouts/default_user_page_layout.dart';
import 'package:flutter/material.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({super.key});

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return DefaultUserPageLayout(
        backgroundColor: Colors.white,
        appBarBackgroundColor: Constants.color1,
        icon: Icons.person,
        screenName: "Profile",
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: [
                SizedBox(height: height * 0.04),
                customRow("First Name", "A,b,c"),
                customRow("Last Name", "A,b,c"),
                customRow("Username", "x,y,z"),
                customRow("Email", "example@gmail.com"),
                customRow("Date Of Birth", "1/1/2000"),
                customRow("Gender", "Male"),
                customRow("Phone Number", "0313******"),
                customRow("WhatsApp Number", "0313******"),
                customRow("CNIC Number", "13302*******"),
                customRow("Promo ID", "1234******"),
              ],
            ),
          ),
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

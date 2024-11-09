import 'package:digital_earning/constants/constants.dart';
import 'package:digital_earning/layouts/user_dashboard_layout.dart';
import 'package:digital_earning/widgets/custom_account_card.dart';
import 'package:digital_earning/widgets/custom_home_card.dart';
import 'package:flutter/material.dart';


class UserHomeScreen extends StatefulWidget {
  const UserHomeScreen({super.key});

  @override
  State<UserHomeScreen> createState() => _UserHomeScreenState();
}

class _UserHomeScreenState extends State<UserHomeScreen> {

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return  UserDashboardLayout(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: height* 0.03,),
              const CustomHomeCard(
                color: Constants.color1,
                text1: "RS 0",
                text2: "RS 2000",
                text3: "Current Earning",
                text4: "Total Earning",
              ),
              SizedBox(height: height * 0.04,),
              const CustomHomeCard(
                  color: Constants.color2,
                  text1: "0",
                  text2: "Rs 2000 ",
                  text3: "Member Adding Tips",
                  text4: "Earning",
              ),
              SizedBox(height: height * 0.04,),
              const CustomHomeCard(
                color: Constants.color3,
                text1: "0",
                text2: "4",
                text3: "Recent Points",
                text4: "Total Points",
              ),
              SizedBox(height: height * 0.04,),
              const CustomHomeCard(
                color: Constants.color4,
                text1: "7000",
                text2: "2",
                text3: "Pouch",
                text4: "Activated Level",
              ),
               SizedBox(height: height* 0.04),
          
            ],
          ),
        ),
      ),
    );
  }
}


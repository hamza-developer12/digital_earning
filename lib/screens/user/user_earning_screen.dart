import 'package:digital_earning/constants/constants.dart';
import 'package:digital_earning/layouts/default_user_page_layout.dart';
import 'package:digital_earning/widgets/user_earning_custom_card.dart';
import 'package:flutter/material.dart';

class UserEarningScreen extends StatefulWidget {
  const UserEarningScreen({super.key});

  @override
  State<UserEarningScreen> createState() => _UserEarningScreenState();
}

class _UserEarningScreenState extends State<UserEarningScreen> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return DefaultUserPageLayout(
        backgroundColor: Colors.white,
        appBarBackgroundColor: Constants.color1,
        icon: Icons.wallet,
        screenName: "Your Earning",
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Column(
              children: [
                SizedBox(height: height* 0.05),
                const UserEarningCustomCard(
                  title: "Total Earning",
                  value: "RS 0.0",
                  color: Constants.color1,
                ),
                SizedBox(height: height* 0.04),
                const UserEarningCustomCard(
                  title: "Earning This Month",
                  value: "RS 0.0",
                  color: Constants.color2,
                ),
                SizedBox(height: height* 0.04),
                const UserEarningCustomCard(
                  title: "Earning Last Month",
                  value: "RS 0.0",
                  color: Constants.color4,
                ),
                SizedBox(height: height* 0.04),
                const UserEarningCustomCard(
                  title: "Withdrawable Amount",
                  value: "RS 0.0",
                  color: Constants.color3 ,
                ),
                SizedBox(height: height* 0.04),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  width: double.infinity,
                  decoration: ShapeDecoration(
                    color: Constants.color1,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  child: const Center(
                    child: Text("Transaction History", style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),),
                  ),
                ),
              //   Date Picker Design here
                SizedBox(height: height*0.04),
                Container(
                  width: double.infinity,
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(width: 1),
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  child:const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Select Transaction Date"),
                        Icon(Icons.calendar_month)
                      ],
                    ),
                  ),
                ),
                SizedBox(height: height * 0.02),
                UserEarningCustomCard(
                    title: "Date",
                    value: "21/02/2024", color: Constants.color6),
                SizedBox(height: height * 0.02),
                UserEarningCustomCard(
                    title: "Reward For Completing Task",
                    value: "Cash", color: Constants.color6),
                SizedBox(height: height * 0.02),
                UserEarningCustomCard(
                    title: "Amount",
                    value: "RS 700", color: Constants.color6),
                SizedBox(height: height * 0.02),
                UserEarningCustomCard(
                    title: "Status",
                    value: "Paid", color: Constants.color6),
                SizedBox(height: height * 0.02),
              ],
            ),
          ),
        ),
    );
  }
}

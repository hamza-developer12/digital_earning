import 'package:digital_earning/constants/constants.dart';
import 'package:digital_earning/layouts/default_admin_page_layout.dart';
import 'package:flutter/material.dart';


class ViewUserScreen extends StatefulWidget {
  final  userData;
  const ViewUserScreen({super.key, required this.userData});

  @override
  State<ViewUserScreen> createState() => _ViewUserScreenState();
}

class _ViewUserScreenState extends State<ViewUserScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultAdminPageLayout(
        backgroundColor: Colors.white,
        appBarBackgroundColor: Constants.color1,
        icon: Icons.person,
        screenName: "User Details",
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
             customRow("Name", widget.userData['name']),
             customRow("Email", widget.userData['email']),
             customRow("Phone No", widget.userData['phoneNumber']),
             customRow("WhatsApp No", widget.userData['whatsAppNumber']),
             customRow("Assignments Completed", "23"),
             customRow("Total Earning", "10000"),
            ],
          ),
        )
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

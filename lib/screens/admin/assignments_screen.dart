import 'package:digital_earning/constants/constants.dart';
import 'package:digital_earning/layouts/default_admin_page_layout.dart';
import 'package:flutter/material.dart';


class AssignmentsScreen extends StatefulWidget {
  const AssignmentsScreen({super.key});

  @override
  State<AssignmentsScreen> createState() => _AssignmentsScreenState();
}

class _AssignmentsScreenState extends State<AssignmentsScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultAdminPageLayout(
        backgroundColor: Constants.color1,
        appBarBackgroundColor: Colors.white,
        icon: Icons.assignment,
        screenName: "Assignments",
        child: Column()
    );
  }
}

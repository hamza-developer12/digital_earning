import 'package:digital_earning/widgets/user_management_card.dart';
import 'package:flutter/material.dart';

import '../../constants/constants.dart';
import '../../layouts/default_admin_page_layout.dart';


class UserManagementScreen extends StatefulWidget {
  const UserManagementScreen({super.key});

  @override
  State<UserManagementScreen> createState() => _UserManagementScreenState();
}

class _UserManagementScreenState extends State<UserManagementScreen> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return DefaultAdminPageLayout(
        backgroundColor: Constants.color1,
        appBarBackgroundColor: Colors.white,
        icon: Icons.group,
        screenName: "User Management",
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              SizedBox(height: height * 0.02),
              UserManagementCard(
                name: "Ali",
                onView: (){},
                onEdit: (){},
                onDelete: (){},
              )
            ],
          ),
        )
    );
  }
}

import 'package:digital_earning/screens/user/user_assignment_screen.dart';
import 'package:digital_earning/screens/user/user_earning_screen.dart';
import 'package:digital_earning/screens/user/user_feedback_screen.dart';
import 'package:digital_earning/screens/user/user_profile_screen.dart';
import 'package:digital_earning/screens/user/user_withdraw_screen.dart';
import 'package:flutter/material.dart';

class UserMenuData {

  List<Map<String,dynamic>> data = [
    {
      "title": "Assignment",
      "icon": Icons.assignment,
      "route": const UserAssignmentScreen(),
    },
    {
      "title": "Earning",
      "icon": Icons.monetization_on,
      "route": const UserEarningScreen()
    },
    {
      "title": "Withdraw",
      "icon": Icons.shop,
      "route": const UserWithdrawScreen()
    },
    {
      "title": "Profile",
      "icon": Icons.person,
      "route": const UserProfileScreen(),
    },
    {
      "title": "Feedback",
      "icon": Icons.edit,
      "route": const UserFeedbackScreen(),
    }

  ];
}
import 'package:digital_earning/screens/admin/assignments_screen.dart';
import 'package:digital_earning/screens/admin/payment_management_screen.dart';
import 'package:digital_earning/screens/admin/settings_screen.dart';
import 'package:digital_earning/screens/admin/user_management_screen.dart';
import 'package:flutter/material.dart';

class AdminMenuData {

  List<Map<String,dynamic>> data = [
    {
      "title": "Assignments",
      "icon": Icons.assignment,
      "route": const AssignmentsScreen(),
    },
    {
      "title": "User Management",
      "icon": Icons.group,
      "route": const UserManagementScreen(),
    },
    {
      "title": "Payment Management",
      "icon": Icons.payment,
      "route": const PaymentManagementScreen(),
    },
    {
      "title": "Settings",
      "icon": Icons.settings,
      "route": const SettingsScreen(),
    }

  ];
}
import 'package:flutter/material.dart';

import '../../constants/constants.dart';
import '../../layouts/default_admin_page_layout.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultAdminPageLayout(
        backgroundColor: Constants.color1,
        appBarBackgroundColor: Colors.white,
        icon: Icons.settings,
        screenName: "Settings",
        child: Column()
    );
  }
}

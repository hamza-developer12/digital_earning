import 'package:flutter/material.dart';

import '../../constants/constants.dart';
import '../../layouts/default_admin_page_layout.dart';


class PaymentManagementScreen extends StatefulWidget {
  const PaymentManagementScreen({super.key});

  @override
  State<PaymentManagementScreen> createState() => _PaymentManagementScreenState();
}

class _PaymentManagementScreenState extends State<PaymentManagementScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultAdminPageLayout(
        backgroundColor: Constants.color1,
        appBarBackgroundColor: Colors.white,
        icon: Icons.payment,
        screenName: "Payment Management",
        child: Column()
    );
  }
}

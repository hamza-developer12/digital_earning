import 'package:digital_earning/providers/payment_provider.dart';
import 'package:digital_earning/providers/user_provider.dart';
import 'package:digital_earning/screens/admin/view_payment_request_screen.dart';
import 'package:digital_earning/widgets/payment_management_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../constants/constants.dart';
import '../../layouts/default_admin_page_layout.dart';

class PaymentManagementScreen extends StatefulWidget {
  const PaymentManagementScreen({super.key});

  @override
  State<PaymentManagementScreen> createState() =>
      _PaymentManagementScreenState();
}

class _PaymentManagementScreenState extends State<PaymentManagementScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<PaymentProvider>(context, listen: false).getAllPayments();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return DefaultAdminPageLayout(
        backgroundColor: Colors.white,
        appBarBackgroundColor: Constants.color1,
        icon: Icons.payment,
        screenName: "Payment Management",
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: height * 0.04),
              const Text("View User Payment Requests",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  )),
              SizedBox(height: height * 0.02),

              Consumer<PaymentProvider>(
                builder: (context, value, child) {
                  if (value.loading) {
                    return const Expanded(
                      child: Center(
                        child:
                            CircularProgressIndicator(color: Constants.color1),
                      ),
                    );
                  } else if (value.paymentRequests.isEmpty) {
                    return const Expanded(
                      child: Center(
                        child: Text("No Payment Request"),
                      ),
                    );
                  } else {
                    return Expanded(
                      child: ListView.builder(
                        itemCount: value.paymentRequests.length,
                        itemBuilder: (context, index) {
                          var payment = value.paymentRequests[index];
                          return Container(
                            child: PaymentManagementCard(
                              name: payment['name'],
                              amount: payment['amount'].toString(),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        ViewPaymentRequestScreen(
                                      data: payment,
                                    ),
                                  ),
                                ).then((_){
                                  value.getAllPayments();
                                });
                              },
                            ),
                          );
                        },
                      ),
                    );
                  }
                },
              ),
              // const PaymentManagementCard(
              //   name: "Ali",
              //   amount: "2000",
              //   date: "Friday",
              //   widget: ViewPaymentRequestScreen(),
              // ),
            ],
          ),
        ));
  }
}

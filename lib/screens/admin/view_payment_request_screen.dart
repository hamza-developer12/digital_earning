import 'package:digital_earning/constants/constants.dart';
import 'package:digital_earning/layouts/default_admin_page_layout.dart';
import 'package:digital_earning/providers/payment_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ViewPaymentRequestScreen extends StatefulWidget {
  final data;
  const ViewPaymentRequestScreen({
    super.key,
    required this.data,
  });

  @override
  State<ViewPaymentRequestScreen> createState() =>
      _ViewPaymentRequestScreenState();
}

class _ViewPaymentRequestScreenState extends State<ViewPaymentRequestScreen> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return DefaultAdminPageLayout(
      backgroundColor: Colors.white,
      appBarBackgroundColor: Constants.color1,
      icon: Icons.payments_outlined,
      screenName: "View Payment Request",
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: height * 0.04,
            ),
            customNameCard(widget.data['name']),
            SizedBox(height: height * 0.02),
            customRow(
              text1: "Account Holder Name",
              text2: widget.data['name'],
              text3: "Bank Name",
              text4: widget.data['paymentMethod'],
            ),
            SizedBox(height: height * 0.02),
            customRow(
              text1: "Withdrawal Amount",
              text2: "RS ${widget.data['amount']}",
              text3: "Account Number",
              text4: widget.data['accountNumber'],
            ),
            SizedBox(height: height * 0.04),
            Consumer<PaymentProvider>(
                builder: (context, value, child) {
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: [
                        customBtn(
                            btnName: "Approve",
                            color: Colors.green,
                            onTap: (){
                              value.approveRequest(context, widget.data['id']).then((_){

                              });
                            }
                        ),
                        Spacer(),
                        customBtn(
                            btnName: "Decline",
                            color: Colors.red,
                            onTap: (){
                              value.declineRequest(context, widget.data['id']);
                            }
                        ),
                      ],
                    ),
                  );
                },
            ),
          ],
        ),
      ),
    );
  }

  Widget customNameCard(String name) {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.all(10),
      height: 44,
      decoration: ShapeDecoration(
        color: Constants.color1,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(11),
        ),
      ),
      child: Center(
          child: Text(name,
              style:
                  const TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
    );
  }

  Widget customBtn({required String btnName, required Color color, required VoidCallback onTap}){
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 18),
        decoration: ShapeDecoration(
            color: color,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5))),
        child: Text(
          btnName.toString(),
          style: const TextStyle(
            fontSize: 16,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
  Widget customRow({
    required String text1,
    required String text2,
    required String text3,
    required String text4,
  }) {
    final height = MediaQuery.of(context).size.height;
    return Row(
      children: [
        Column(
          crossAxisAlignment:
              CrossAxisAlignment.start, // Aligns children to the left
          children: [
            Text(
              text1.toString(),
              style: largeText,
            ),
            SizedBox(
              height: height * 0.01,
            ),
            Text(
              text2.toString(),
              style: mediumText,
            ), // This will be aligned to the left
          ],
        ),
        const Spacer(),
        Column(
          crossAxisAlignment:
              CrossAxisAlignment.end, // Aligns children to the left
          children: [
            Text(text3.toString(), style: largeText),
            SizedBox(
              height: height * 0.01,
            ),
            Text(
              text4.toString(),
              style: mediumText,
            ), // This will be aligned to the left
          ],
        ),
      ],
    );
  }

  TextStyle largeText = const TextStyle(
    fontSize: 17,
    fontWeight: FontWeight.bold,
  );
  TextStyle mediumText = const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );
}

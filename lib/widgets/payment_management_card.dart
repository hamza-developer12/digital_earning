import 'package:digital_earning/constants/constants.dart';
import 'package:flutter/material.dart';

class PaymentManagementCard extends StatelessWidget {
  final String name;
  final String amount;
  final Function()? onTap;
  const PaymentManagementCard({
    super.key,
    required this.name,
    required this.amount,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      width: double.infinity,
      decoration: ShapeDecoration(
        color: Constants.color1,
        shape: RoundedRectangleBorder(
          side: const BorderSide(width: 1),
          borderRadius: BorderRadius.circular(24),
        ),
      ),
      child: Row(
        children: [
          Text("$name Requested RS $amount", style: const  TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),),
          const Spacer(),

          GestureDetector(
            onTap: onTap,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
              ),
              child: const Text("View", style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),),
            ),
          ),
        ],
      ),
    );
  }
}

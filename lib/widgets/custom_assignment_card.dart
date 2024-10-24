import 'package:flutter/material.dart';

class CustomAssignmentCard extends StatelessWidget {
  final String assignmentName;
  const CustomAssignmentCard({
    super.key,
    required this.assignmentName,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8),
      width: double.infinity,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      child: Center(child: Text(assignmentName, style: TextStyle(
        fontSize: 15
      ),)),
    );
  }
}

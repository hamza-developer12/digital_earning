import 'package:digital_earning/constants/constants.dart';
import 'package:digital_earning/layouts/default_user_page_layout.dart';
import 'package:digital_earning/widgets/custom_assignment_card.dart';
import 'package:flutter/material.dart';

class UserAssignmentScreen extends StatefulWidget {
  const UserAssignmentScreen({super.key});

  @override
  State<UserAssignmentScreen> createState() => _UserAssignmentScreenState();
}

class _UserAssignmentScreenState extends State<UserAssignmentScreen> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return DefaultUserPageLayout(
        backgroundColor: Constants.color1,
        appBarBackgroundColor: Colors.white,
        screenName: "Assignments",
        icon: Icons.assignment,
        child: Padding(

          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              SizedBox(height: height * 0.05),
              const Text(
                "View Complete Assignment",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: height * 0.02),
              Row(
                children: [
                  const Expanded(
                    child: CustomAssignmentCard(
                      assignmentName: "Urdu Assignment",
                    ),
                  ),
                  SizedBox(width: width * 0.01),
                  const Icon(Icons.download, size: 35)
                ],
              ),
              SizedBox(height: height * 0.02),
              Row(
                children: [
                  const Expanded(
                    child: CustomAssignmentCard(
                      assignmentName: "English Assignment",
                    ),
                  ),
                  SizedBox(width: width * 0.01),
                  const Icon(Icons.download, size: 35)
                ],
              ),
              SizedBox(height: height * 0.02),
              Row(
                children: [
                  const Expanded(
                    child: CustomAssignmentCard(
                      assignmentName: "Physics Assignment",
                    ),
                  ),
                  SizedBox(width: width * 0.01),
                  const Icon(Icons.download, size: 35)
                ],
              ),
            ],
          ),
        ));
  }
}

import 'package:digital_earning/Helper/ui_helper.dart';
import 'package:digital_earning/constants/constants.dart';
import 'package:digital_earning/layouts/default_admin_page_layout.dart';
import 'package:digital_earning/providers/assignment_provider.dart';
import 'package:digital_earning/widgets/custom_assignment_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AssignmentsScreen extends StatefulWidget {
  const AssignmentsScreen({super.key});

  @override
  State<AssignmentsScreen> createState() => _AssignmentsScreenState();
}

class _AssignmentsScreenState extends State<AssignmentsScreen> {
  final assignmentProvider = AssignmentProvider();
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Fetch assignments on screen load
    Provider.of<AssignmentProvider>(context, listen: false).getAllAssignments();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultAdminPageLayout(
      backgroundColor: Constants.color1,
      appBarBackgroundColor: Colors.white,
      icon: Icons.assignment,
      screenName: "Assignments",
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Consumer<AssignmentProvider>(
          builder: (context, value, child) {
            if (value.loading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (value.assignments.isNotEmpty) {
              return ListView.builder(
                itemCount: value.assignments.length,
                itemBuilder: (context, index) {
                  var assignment = value.assignments[index];
                  return customContainer(
                    name: assignment['assignmentName'],
                    onPressed: () {
                      showPopup(() async {
                        Navigator.pop(context);
                        // Call deleteAssignment and check if the widget is still mounted
                        value.deleteAssignment(context, assignment['assignmentName'], assignment['fileUrl']).then((_){
                          value.getAllAssignments();
                        });

                      });
                    },
                  );
                },
              );
            } else {
              return const Center(
                child: Text("No Assignment Found"),
              );
            }
          },
        ),
      ),
    );
  }

  Widget customContainer({required String name, required VoidCallback onPressed}) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10)
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(name, style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600
            )),
            IconButton(onPressed: onPressed, icon: const Icon(Icons.delete))
          ],
        ),
      ),
    );
  }

  void showPopup(VoidCallback delete) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Are You Sure Want To Delete This Assignment?", style: TextStyle(fontSize: 16)),
          actions: [
            TextButton(onPressed: delete, child: const Text("Yes")),
            TextButton(onPressed: () => Navigator.pop(context), child: const Text("No")),
          ],
        );
      },
    );
  }
}

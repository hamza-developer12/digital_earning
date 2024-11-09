import 'package:digital_earning/constants/constants.dart';
import 'package:digital_earning/layouts/default_user_page_layout.dart';
import 'package:digital_earning/providers/assignment_provider.dart';
import 'package:digital_earning/screens/user/upload_solution_screen.dart';
import 'package:digital_earning/widgets/custom_assignment_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserAssignmentScreen extends StatefulWidget {
  const UserAssignmentScreen({super.key});

  @override
  State<UserAssignmentScreen> createState() => _UserAssignmentScreenState();
}

class _UserAssignmentScreenState extends State<UserAssignmentScreen> {

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    Provider.of<AssignmentProvider>(context, listen: false).getAllAssignments();
  }
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
                "View All Assignment",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: height * 0.02),
              Consumer<AssignmentProvider>(
                  builder: (context, value, child) {
                    if(value.loading) {
                      return const Expanded(
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      );
                    }else if(value.assignments.isEmpty) {
                      return const Expanded(
                        child: Center(
                          child: Text("No Assignment Found"),
                        ),
                      );
                    }else {
                      return Expanded(
                        child: ListView.builder(
                          itemCount: value.assignments.length,
                          itemBuilder: (context, index) {
                            var assignment = value.assignments[index];
                            return Row(
                              children: [
                                Expanded(
                                    child: CustomAssignmentCard(
                                        assignmentName: assignment['assignmentName']
                                    ),
                                ),
                                IconButton(onPressed: value.downloading ? null :(){
                                  value.downloadFile(context, assignment['fileUrl']);
                                }, icon: value.downloading ? CircularProgressIndicator(): Icon(Icons.download)),
                                IconButton(onPressed: (){
                                  Navigator.push(context,MaterialPageRoute(builder: (context) => UploadSolutionScreen(assignment:assignment),));
                                }, icon: Icon(Icons.upload))
                              ],
                            );
                          },
                        ),
                      );
                    }
                  },
              ),

              // SizedBox(height: height * 0.02),
              // Row(
              //   children: [
              //     const Expanded(
              //       child: CustomAssignmentCard(
              //         assignmentName: "English Assignment",
              //       ),
              //     ),
              //     SizedBox(width: width * 0.01),
              //     const Icon(Icons.download, size: 35)
              //   ],
              // ),
              // SizedBox(height: height * 0.02),
              // Row(
              //   children: [
              //     const Expanded(
              //       child: CustomAssignmentCard(
              //         assignmentName: "Physics Assignment",
              //       ),
              //     ),
              //     SizedBox(width: width * 0.01),
              //     const Icon(Icons.download, size: 35)
              //   ],
              // ),
            ],
          ),
        ));
  }
}

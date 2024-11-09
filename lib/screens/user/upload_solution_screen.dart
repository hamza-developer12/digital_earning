import 'package:digital_earning/constants/constants.dart';
import 'package:digital_earning/layouts/default_user_page_layout.dart';
import 'package:digital_earning/providers/assignment_provider.dart';
import 'package:digital_earning/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UploadSolutionScreen extends StatefulWidget {
  final assignment;
  const UploadSolutionScreen({super.key, required this.assignment});

  @override
  State<UploadSolutionScreen> createState() => _UploadSolutionScreenState();
}

class _UploadSolutionScreenState extends State<UploadSolutionScreen> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return DefaultUserPageLayout(
      backgroundColor: Colors.white,
      appBarBackgroundColor: Constants.color1,
      icon: Icons.upload,
      screenName: "Upload Solution",
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: height * 0.04),
            customContainer(
              child: Text(
                widget.assignment['assignmentName'],
              ),
            ),
            SizedBox(height: height * 0.02,),
            Consumer<AssignmentProvider>(
              builder: (context, value, child) {
                return GestureDetector(
                  onTap: (){
                    value.getFile();
                  },
                  child: customContainer(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(value.fileSelected ? "File Selected":"Select a file"),
                        Icon(Icons.upload_file)
                      ],
                    ),
                  ),
                );
              },
            ),
            SizedBox(height: height * 0.03,),
           Consumer<AssignmentProvider>(
               builder: (context, value, child) {
                 if(value.loading) {
                   return const Center(
                     child: CircularProgressIndicator(color: Constants.color1,),
                   );
                 }else {
                   return CustomButton(btnText: "Upload Solution", onTap: (){
                     value.uploadSolution(context, widget.assignment['assignmentName']);
                   });
                 }
               },
           ),
          ],
        ),
      ),
    );
  }

  Widget customContainer({required Widget child}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      decoration: BoxDecoration(
          border: Border.all(
            color: Constants.primaryColor,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(5)),
      child: child,
    );
  }
}

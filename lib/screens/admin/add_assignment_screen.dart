import 'package:digital_earning/constants/constants.dart';
import 'package:digital_earning/layouts/default_admin_page_layout.dart';
import 'package:digital_earning/providers/assignment_provider.dart';
import 'package:digital_earning/widgets/custom_button.dart';
import 'package:digital_earning/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddAssignmentScreen extends StatefulWidget {
  const AddAssignmentScreen({super.key});

  @override
  State<AddAssignmentScreen> createState() => _AddAssignmentScreenState();
}

class _AddAssignmentScreenState extends State<AddAssignmentScreen> {
  final _formKey = GlobalKey<FormState>();
  final _assignmentNameController = TextEditingController();
  final _assignmentAmountController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return DefaultAdminPageLayout(
        backgroundColor: Colors.white,
        appBarBackgroundColor: Constants.color1,
        icon: Icons.assignment_turned_in,
        screenName: "Add Assignment",
        child: Padding(

          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: height * 0.05),
              CustomTextField(
                  controller: _assignmentNameController,
                  hintText: "Enter Assignment Name",
                  validator: (value){}
              ),
              SizedBox(height: height * 0.02),
              CustomTextField(
                  controller: _assignmentAmountController,
                  hintText: "Enter Assignment Amount",
                  validator: (value){}
              ),
              SizedBox(height: height * 0.02),
              Consumer<AssignmentProvider>(
                builder: (context, value, child) {
                  return GestureDetector(
                    onTap: (){
                      value.getFile();
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                      decoration: ShapeDecoration(
                          shape: RoundedRectangleBorder(
                              side: const BorderSide(width: 1,color: Colors.black45),
                              borderRadius: BorderRadius.circular(5)
                          )
                      ),
                      child:  Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(value.fileSelected ? "File Selected": "Select a file", style: const TextStyle(
                            fontSize: 16,
                            color: Colors.black45,
                          )),
                           const Icon(
                            Icons.add_link,
                            size: 30,
                            color: Colors.black45,
                          ),

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
                    return  const Center(
                      child: CircularProgressIndicator(color: Constants.color1,),
                    );
                  }else {
                    return CustomButton(btnText: "Upload Assignment", onTap: (){
                      value.uploadAssignment(context,
                          _assignmentNameController.text,
                          _assignmentAmountController.text);
                    });
                  }
                },
              )
            ],
          ),
        )
    );
  }
}

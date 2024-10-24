import 'package:digital_earning/constants/constants.dart';
import 'package:digital_earning/layouts/default_user_page_layout.dart';
import 'package:digital_earning/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class UserWithdrawScreen extends StatefulWidget {
  const UserWithdrawScreen({super.key});

  @override
  State<UserWithdrawScreen> createState() => _UserWithdrawScreenState();
}

class _UserWithdrawScreenState extends State<UserWithdrawScreen> {
  TextEditingController paymentMethodController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return DefaultUserPageLayout(
        backgroundColor: Colors.white,
        appBarBackgroundColor: Constants.color1,
        icon: Icons.camera_enhance_outlined,
        screenName: "Withdraw Option",
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Image.asset("assets/images/logo.png", width: width * 0.5,),
              Container(
                padding: EdgeInsets.symmetric(vertical: 10),
                width: double.infinity,
                decoration: ShapeDecoration(
                  color: Color(0xFF00C3CC),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: const Center(child: Text("Payment Method", style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold
                ),)),
              ),
              SizedBox(height: height * 0.03),
              const Align(
                alignment: Alignment.centerLeft,
                  child: Text(" Enter Payment Method"),),
              SizedBox(height: height * 0.005),
              customTextField(
                controller: paymentMethodController,
                hintText: "Easypaisa / Jazzcash",
                validator: (value){
                  if(value!.isEmpty) {
                    return "Please provide a valid payment method";
                  }
                }
              ),
              SizedBox(height: height * 0.02),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(" Enter Account Number"),),
              SizedBox(height: height * 0.005),
              customTextField(
                  controller: phoneNumberController,
                  hintText: "03*****",
                  validator: (value){
                    if(value!.isEmpty) {
                      return "Please provide a valid payment method";
                    }
                  }
              ),
              SizedBox(height: height * 0.02),
              customBtn(
                onTap: (){},
              ),
            ],
          ),
        )
    );
  }

  Widget customTextField(
      {required TextEditingController controller,
      required String hintText,
      required FormFieldValidator<String> validator}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      width: double.infinity,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          side: const BorderSide(width: 1),
          borderRadius: BorderRadius.circular(20),
        ),
      ),

      child: TextFormField(
        controller: controller,
        validator: validator,
        decoration: InputDecoration(
          hintText: hintText.toString(),
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          errorBorder: InputBorder.none
        ),
      ),
    );
  }

  Widget customBtn({required VoidCallback onTap,}) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width * 0.6,
        height: height * 0.05,
        decoration: ShapeDecoration(
          color: Color(0xFF00C3CC),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        child: const Center(
          child: Text("Submit", style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          )),
        ),
      ),
    );
  }
}

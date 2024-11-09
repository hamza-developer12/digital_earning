import 'package:digital_earning/constants/constants.dart';
import 'package:digital_earning/layouts/default_user_page_layout.dart';
import 'package:digital_earning/providers/payment_provider.dart';
import 'package:digital_earning/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserWithdrawScreen extends StatefulWidget {
  const UserWithdrawScreen({super.key});

  @override
  State<UserWithdrawScreen> createState() => _UserWithdrawScreenState();
}

class _UserWithdrawScreenState extends State<UserWithdrawScreen> {
  TextEditingController paymentMethodController = TextEditingController();
  TextEditingController accountNumberController = TextEditingController();
  TextEditingController amountController = TextEditingController();
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
                hintText: "Easypaisa / Jazzcash / BankAccount Name",
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
                  controller: accountNumberController,
                  hintText: "03*****",
                  validator: (value){
                    if(value!.isEmpty) {
                      return "Please provide a valid payment method";
                    }
                  }
              ),
              // SizedBox(height: height * 0.02),
              // const Align(
              //   alignment: Alignment.centerLeft,
              //   child: Text(" Enter Amount"),),
              // SizedBox(height: height * 0.005),
              // customTextField(
              //     controller: amountController,
              //     type: TextInputType.number,
              //     hintText: "Enter Amount",
              //     validator: (value){
              //       if(value!.isEmpty) {
              //         return "Please provide an Amount";
              //       }
              //     }
              // ),
              SizedBox(height: height * 0.02),
              Consumer<PaymentProvider>(builder: (context, value, child) {
                return value.loading ? const Center(
                  child: CircularProgressIndicator(color: Constants.color1,),
                ) : customBtn(
                  onTap: (){
                    value.requestPayment(
                      context,
                      paymentMethodController.text,
                      accountNumberController.text,
                      double.parse("0.0"),
                    ).then((_){
                      accountNumberController.clear();
                      paymentMethodController.clear();
                      amountController.clear();
                    });
                  },
                );
              },)
            ],
          ),
        )
    );
  }

  Widget customTextField(
      {required TextEditingController controller,
      required String hintText,
      required FormFieldValidator<String> validator, TextInputType? type}) {
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
        keyboardType: TextInputType.text ?? type,
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

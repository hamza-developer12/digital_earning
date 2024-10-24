import 'package:digital_earning/widgets/custom_button.dart';
import 'package:digital_earning/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _userNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _dateController = TextEditingController();
  final _genderController = TextEditingController();
  final _numberController = TextEditingController();
  final _waNumberController = TextEditingController();
  final _cnicController = TextEditingController();
  final _promoIdController = TextEditingController();
  final _passwdController = TextEditingController();
  final _confirmPasswdController = TextEditingController();

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _userNameController.dispose();
    _emailController.dispose();
    _dateController.dispose();
    _genderController.dispose();
    _numberController.dispose();
    super.dispose();
  }

  Future<void> _selectDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (pickedDate != null) {
      setState(() {
        _dateController.text = "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: const Text("Register"),
          centerTitle: true,
        ),
        body: SafeArea(
          bottom: true,
          child: SingleChildScrollView(
            padding: const EdgeInsets.only(bottom: 100),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Image.asset("assets/images/logo.png", width: width * 0.65),
                  ),
                  CustomTextField(
                    controller: _firstNameController,
                    hintText: "Enter First Name",
                    validator: (value) => value!.isEmpty ? "Please Provide a valid Value" : null,
                  ),
                  SizedBox(height: height * 0.02),
                  CustomTextField(
                    controller: _lastNameController,
                    hintText: "Enter Last Name",
                    validator: (value) => value!.isEmpty ? "Please Provide a valid Value" : null,
                  ),
                  SizedBox(height: height * 0.02),
                  CustomTextField(
                    controller: _userNameController,
                    hintText: "Enter Username",
                    validator: (value) => value!.isEmpty ? "Please provide a username" : null,
                  ),
                  SizedBox(height: height * 0.02),
                  CustomTextField(
                    controller: _emailController,
                    hintText: "Enter Email",
                    validator: (value) => !value!.contains("@") || value.isEmpty
                        ? "Please provide Email"
                        : null,
                  ),
                  SizedBox(height: height * 0.02),
                  GestureDetector(
                    onTap: () => _selectDate(context),
                    child: AbsorbPointer(
                      child: CustomTextField(
                        controller: _dateController,
                        textInputType: TextInputType.datetime,
                        hintText: "Enter Date Of Birth",
                        iconData: Icons.calendar_month,
                        validator: (value) => value!.isEmpty ? "Please provide a Date of Birth" : null,
                      ),
                    ),
                  ),
                  SizedBox(height: height * 0.02),
                  CustomTextField(
                    controller: _genderController,
                    hintText: "Enter Gender",
                    validator: (value) => value!.isEmpty ? "Please provide a Gender" : null,
                  ),
                  SizedBox(height: height * 0.02),
                  CustomTextField(
                    controller: _numberController,
                    hintText: "Enter Phone Number",
                    validator: (value) => value!.isEmpty ? "Please provide a Phone Number" : null,
                  ),
                  SizedBox(height: height * 0.02),
                  CustomTextField(
                    controller: _waNumberController,
                    hintText: "Enter Whatsapp Number",
                    validator: (value) => value!.isEmpty ? "Please provide a WhatsApp Number" : null,
                  ),
                  SizedBox(height: height * 0.02),

                  CustomTextField(
                    controller: _cnicController,
                    hintText: "Enter Cnic Number",
                    validator: (value) => value!.isEmpty ? "Please provide a Cnic Number" : null,
                  ),
                  SizedBox(height: height * 0.02),
                  CustomTextField(
                    controller: _promoIdController,
                    hintText: "Enter Promo Id",
                    validator: (value) => value!.isEmpty ? "Please provide a Promo Id" : null,
                  ),
                  SizedBox(height: height * 0.02),
                  CustomTextField(
                    controller: _passwdController,
                    hintText: "Enter Password",
                    obscureText: true,
                    validator: (value) => value!.isEmpty ? "Please provide a Password" : null,
                  ),
                  SizedBox(height: height * 0.02),
                  CustomTextField(
                    controller: _confirmPasswdController,
                    obscureText: true,
                    hintText: "Confirm Password",
                    validator: (value) => value!.isEmpty ? "Please Re Enter Password" : null,
                  ),
                  SizedBox(height: height * 0.02),
                  CustomButton(btnText: "Register", onTap: (){
                    if(_formKey.currentState!.validate()) {

                    }
                  })
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

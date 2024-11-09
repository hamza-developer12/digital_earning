import 'package:digital_earning/Helper/ui_helper.dart';
import 'package:digital_earning/constants/constants.dart';
import 'package:digital_earning/providers/auth_provider.dart';
import 'package:digital_earning/widgets/custom_button.dart';
import 'package:digital_earning/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
  String _selectedGender = "";
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
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    alignment: Alignment.centerLeft,
                    child: const Text("Select Gender: ", style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    )),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Row(
                      children: [
                        const Text("Male", style: TextStyle(fontSize: 16),),
                        Radio(value: "Male", groupValue: _selectedGender, onChanged: (value) {
                          setState(() {
                            _selectedGender = value.toString();
                          });
                        }),
                        const Text("Female",style: TextStyle(fontSize: 16)),
                        Radio(value: "Female", groupValue: _selectedGender, onChanged: (value) {
                          setState(() {
                            _selectedGender = value.toString();
                          });
                        }),
                      ],
                    ),
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
                  Consumer<AuthProvider>(builder: (context, value, child) {
                    if(value.loading == true){
                      return const Center(
                        child: CircularProgressIndicator(
                          color: Constants.color1,
                        )
                      );
                    }else {
                      return CustomButton(btnText: "Register", onTap: ()async{
                        if(_formKey.currentState!.validate()) {
                          if(_selectedGender.isNotEmpty) {
                            String fullName = "${_firstNameController.text} ${_lastNameController.text}";
                            Map<String,dynamic> data = {
                              'name': fullName.toString(),
                              'email': _emailController.text,
                              'birth': _dateController.text,
                              'gender': _selectedGender,
                              'phoneNumber': _numberController.text,
                              'whatsAppNumber': _waNumberController.text,
                              'cnic': _cnicController.text,
                              'promoId': _promoIdController.text,
                              'password': _passwdController.text,
                            };

                            value.register(context, data);
                          }
                        }else{
                          UiHelper.errorFlushMessage(context, "Please Select a Gender");
                        }
                      });
                    }
                  },)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

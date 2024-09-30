import 'package:digital_earning/constants/constants.dart';
import 'package:digital_earning/screens/shared/signup_screen.dart';
import 'package:digital_earning/widgets/custom_button.dart';
import 'package:digital_earning/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child:
                    Image.asset("assets/images/logo.png", width: width * 0.65),
              ),
              CustomTextField(
                controller: _emailController,
                hintText: "Enter Email",
                validator: (value) {
                  if (!value!.contains("@")) {
                    return "Please provide a valid email";
                  }
                },
              ),
              SizedBox(
                height: height * 0.04,
              ),
              CustomTextField(
                controller: _emailController,
                hintText: "Enter Email",
                validator: (value) => "Please provide a valid email",
              ),
              SizedBox(height: height * 0.04),
              CustomButton(btnText: "LOGIN", onTap: () {}),
              SizedBox(height: height * 0.02),
              Container(
                margin: const EdgeInsets.only(
                  right: 20,
                ),
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: () {},
                  child: const Text(
                    'Forgot Password? ',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              SizedBox(height: height * 0.03),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don't have an account?",
                      style: TextStyle(
                        fontSize: 16,
                      )),
                  SizedBox(width: width * 0.02),
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const SignupScreen(),));
                    },
                    child: const Text(
                      "Signup",
                      style:
                      TextStyle(fontSize: 16, color: Constants.primaryColor),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

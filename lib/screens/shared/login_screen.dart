import 'package:digital_earning/constants/constants.dart';
import 'package:digital_earning/providers/auth_provider.dart';
import 'package:digital_earning/screens/shared/signup_screen.dart';
import 'package:digital_earning/widgets/custom_button.dart';
import 'package:digital_earning/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

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
                controller: _passwordController,
                hintText: "Enter Password",
                obscureText: true,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please provide password";
                  } else if (value.length < 6) {
                    return "Password must be 6 characters long";
                  }
                },
              ),
              SizedBox(height: height * 0.04),
              Consumer<AuthProvider>(
                builder: (context, value, child) {
                  if (value.loading) {
                    return const Center(
                      child: CircularProgressIndicator(color: Constants.color1),
                    );
                  } else {
                    return CustomButton(
                        btnText: "LOGIN",
                        onTap: () {
                          if (_formKey.currentState!.validate()) {
                            value.login(context, _emailController.text,
                                _passwordController.text);
                          }
                        });
                  }
                },
              ),
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
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SignupScreen(),
                          ));
                    },
                    child: const Text(
                      "Signup",
                      style: TextStyle(
                        fontSize: 16,
                        color: Constants.primaryColor,
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: height * 0.02,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                alignment: Alignment.centerLeft,
                child: const Text("Address: ",
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ),
              Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: const Text(
                  "Address: Main G.T Road Uppal Chowk, Basti Wah Cantt Opposite Asian Mall NH5 Wah",
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
              ),
              SizedBox(height: height* 0.01),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                alignment: Alignment.centerLeft,
                child: const Text("Instagram: ",
                    style:
                    TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ),
              Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.only(left: 20, right: 10),
                child:  SelectableText(
                  "https://www.instagram.com/digitalearningpartnership?igsh=a2VzMzByazB1NTV3",
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

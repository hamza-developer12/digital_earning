import 'package:digital_earning/constants/constants.dart';
import 'package:flutter/material.dart';


class AuthenticationScreen extends StatelessWidget {
  const AuthenticationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return  Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircularProgressIndicator(color: Constants.color1,),
            SizedBox(height: height * 0.02,),
            const Text("Authenticating"),
          ],
        ),
      ),
    );
  }
}

import 'package:digital_earning/screens/shared/auth_controller.dart';
import 'package:digital_earning/screens/shared/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(
        const Duration(seconds: 3),
        () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const AuthController(),
              ),
            ));
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
        backgroundColor: Colors.lightBlue[100], // Similar background color
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/images/logo.png", width: width * 0.6),
            SpinKitFadingCircle(
              color:
                  Colors.blue[900], // Similar color to the spinner in the image
              size: 50.0, // Adjust the size to match the image
            ),
          ],
        ));
  }
}

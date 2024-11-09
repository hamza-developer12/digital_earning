import 'package:digital_earning/screens/admin/admin_home_screen.dart';
import 'package:digital_earning/screens/shared/authentication_screen.dart';
import 'package:digital_earning/screens/shared/login_screen.dart';
import 'package:digital_earning/screens/user/user_home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class AuthController extends StatefulWidget {
  const AuthController({super.key});

  @override
  State<AuthController> createState() => _AuthControllerState();
}

class _AuthControllerState extends State<AuthController> {
  FirebaseAuth auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: auth.userChanges(),
        builder: (context, snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting) {
            return const AuthenticationScreen();
          }else if(snapshot.hasData && snapshot.data!.photoURL == "admin"){
            return const AdminHomeScreen();
          }else if(snapshot.hasData && snapshot.data!.photoURL == "user"){
            return const UserHomeScreen();
          }else{
            return const LoginScreen();
          }
        },
    );
  }
}

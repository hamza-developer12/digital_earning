import 'package:digital_earning/providers/auth_provider.dart';
import 'package:digital_earning/screens/admin/admin_home_screen.dart';
import 'package:digital_earning/screens/shared/login_screen.dart';
import 'package:digital_earning/screens/splash_screen.dart';
import 'package:digital_earning/screens/user/user_feedback_screen.dart';
import 'package:digital_earning/screens/user/user_home_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform
  );
  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (context) => AuthProvider()),
      ],
      child: MaterialApp(
        title: 'Digital Earning App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
        ),
        home: const LoginScreen()
      ),
    );
  }
}



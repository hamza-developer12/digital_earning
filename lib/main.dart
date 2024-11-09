import 'package:digital_earning/providers/assignment_provider.dart';
import 'package:digital_earning/providers/auth_provider.dart';
import 'package:digital_earning/providers/earning_provider.dart';
import 'package:digital_earning/providers/feedback_provider.dart';
import 'package:digital_earning/providers/payment_provider.dart';
import 'package:digital_earning/providers/user_provider.dart';
import 'package:digital_earning/screens/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthProvider()),
        ChangeNotifierProvider(create: (context) => AssignmentProvider()),
        ChangeNotifierProvider(create: (context) => UserProvider()),
        ChangeNotifierProvider(create: (context) => PaymentProvider()),
        ChangeNotifierProvider(create: (context) => FeedbackProvider()),
        ChangeNotifierProvider(create: (context) => EarningProvider()),
      ],
      child: MaterialApp(
        title: 'Digital Earning App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
        ),
        home: SplashScreen(),
      ),
    );
  }
}

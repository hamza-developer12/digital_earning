import 'package:flutter/material.dart';

class UserDashboardLayout extends StatefulWidget {
  final Widget child;
  const UserDashboardLayout({super.key, required this.child});

  @override
  State<UserDashboardLayout> createState() => _UserDashboardLayoutState();
}

class _UserDashboardLayoutState extends State<UserDashboardLayout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Dashboard"),
          centerTitle: true,
          leading: Builder(
            builder: (context) {
              return IconButton(onPressed: (){
                Scaffold.of(context).openDrawer();
              }, icon: Icon(Icons.menu));
            }
          ),
          actions: [
            Image.asset(
              "assets/images/logo.png",
              height: 80,
              scale: 2,
            )
          ],
        ),
        drawer: const Drawer(
          child: SafeArea(
            child: Column(
              children: [
                Text("Hello")
              ],
            ),
          ),
        ),
        body: SafeArea(
          child: widget.child,
        ),

    );
  }
}

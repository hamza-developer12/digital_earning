import 'package:digital_earning/constants/constants.dart';
import 'package:digital_earning/providers/auth_provider.dart';
import 'package:provider/provider.dart';
import 'package:digital_earning/screens/admin/admin_menu_data.dart';
import 'package:flutter/material.dart';

class AdminDashboardLayout extends StatefulWidget {
  final Widget child;
  const AdminDashboardLayout({super.key, required this.child});

  @override
  State<AdminDashboardLayout> createState() => _AdminDashboardLayoutState();
}

class _AdminDashboardLayoutState extends State<AdminDashboardLayout> {

  final menuData = AdminMenuData();
  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context, listen: true);
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      drawer: Drawer(
        backgroundColor: Constants.color1,
        child: SafeArea(
          child: Column(
            children: [
              DrawerHeader(
                child: Image.asset("assets/images/logo.png"),
              ),
              Column(
                children: menuData.data
                    .map((e) => GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => e['route'],
                        ));
                  },
                  child: Container(
                    color: Colors.transparent,
                    margin: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 5),
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 20),
                    child: Row(
                      children: [
                        Icon(e['icon'], size: 30),
                        SizedBox(width: width * 0.03),
                        Text(
                          e['title'],
                          style: const TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  ),
                ))
                    .toList(),
              ),
              GestureDetector(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text(
                        "Are You Sure You Want To Logout? ",
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      actions: [
                        TextButton(onPressed: () async{
                           authProvider.logout(context);
                        }, child: const Text("Yes")),
                        TextButton(onPressed: () {
                          Navigator.pop(context);
                        }, child: const Text("No"))
                      ],
                    ),
                  );
                },
                child: Container(
                  margin:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  padding:
                  const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  child: Row(
                    children: [
                      const Icon(Icons.logout, size: 30),
                      SizedBox(width: width * 0.03),
                      const Text(
                        "Logout",
                        style: TextStyle(fontSize: 18),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      body: SafeArea(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Builder(
                          builder: (context) {
                            return IconButton(onPressed: (){
                              Scaffold.of(context).openDrawer();
                            }, icon: Icon(Icons.menu, size: 35,),);
                          }
                      ),
                      SizedBox(width: width*0.02,),
                      const Text("Dashboard", style: TextStyle(
                        fontSize: 20,
                      ),)
                    ],
                  ),
                  Image.asset("assets/images/logo.png", width: 80, height: 70,)
                ],
              ),
              Expanded(
                child: widget.child,
              ),
            ],
          )
      ),
    );
  }
}

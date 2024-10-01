import 'package:digital_earning/screens/user/user_menu_data.dart';
import 'package:flutter/material.dart';

class UserDashboardLayout extends StatefulWidget {
  final Widget child;
  const UserDashboardLayout({super.key, required this.child});

  @override
  State<UserDashboardLayout> createState() => _UserDashboardLayoutState();
}

class _UserDashboardLayoutState extends State<UserDashboardLayout> {
  final menuData = UserMenuData();
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
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
        drawer:  Drawer(
          child: SafeArea(
            child: Column(
              children: [
               const DrawerHeader(
                 child: Text("Dashboard"),
               ),
                Column(
                  children: menuData.data.map((e) => GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => e['route'],));
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                      child: Row(
                        children: [
                          Icon(e['icon'], size: 30),
                          SizedBox(width: width * 0.03),
                          Text(e['title'], style: const TextStyle(
                            fontSize: 18,
                          ),
                          ),
                        ],
                      ),
                    ),
                  )).toList(),
                ),
                GestureDetector(
                  onTap: (){
                    showDialog(context: context, builder: (context) => AlertDialog(
                      title: Text("Are You Sure You Want To Logout? ", style: TextStyle(
                        fontSize: 18,
                      ),
                      ),
                      actions: [
                        TextButton(onPressed: (){}, child: Text("Yes")),
                        TextButton(onPressed: (){}, child: Text("No"))
                      ],
                    ),
                   );
                  },
                  child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                    child: Row(
                      children: [
                        Icon(Icons.logout, size: 30),
                        SizedBox(width: width * 0.03),
                        Text("Logout", style: TextStyle(
                          fontSize: 18
                        ),)
                      ],
                    ),
                  ),
                )
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

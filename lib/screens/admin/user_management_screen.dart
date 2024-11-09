import 'package:digital_earning/providers/user_provider.dart';
import 'package:digital_earning/screens/admin/view_user_screen.dart';
import 'package:digital_earning/widgets/user_management_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../constants/constants.dart';
import '../../layouts/default_admin_page_layout.dart';

class UserManagementScreen extends StatefulWidget {
  const UserManagementScreen({super.key});

  @override
  State<UserManagementScreen> createState() => _UserManagementScreenState();
}

class _UserManagementScreenState extends State<UserManagementScreen> {
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    Provider.of<UserProvider>(context, listen: false).showUsers();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return DefaultAdminPageLayout(
        backgroundColor: Constants.color1,
        appBarBackgroundColor: Colors.white,
        icon: Icons.group,
        screenName: "User Management",
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Consumer<UserProvider>(
            builder: (context, value, child) {
              if (value.loading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (value.users.isEmpty) {
                return const Center(
                  child: Text("No User Found"),
                );
              } else {
                return ListView.builder(
                  itemCount: value.users.length,
                  itemBuilder: (context, index) {
                    var user = value.users[index];
                    return Container(
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      child: UserManagementCard(
                        name: user['name'],
                        onView: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ViewUserScreen(
                                userData: user,
                              ),
                            ),
                          );
                        },
                        onEdit: () {},
                        onDelete: () {
                          showPopup();
                        },
                      ),
                    );
                  },
                );
              }
            },
          ),
        ));
  }
  void showPopup() {
    showDialog(context: context, builder: (context) {
      return AlertDialog(
        title: const Text("Are you Sure You want to delete this user", style: TextStyle(
          fontSize: 16,
        ),),
        actions: [
          TextButton(onPressed: (){}, child: const Text("Yes")),
          TextButton(onPressed: (){
            Navigator.pop(context);
          }, child: const Text("No")),
        ],
      );
    },);
  }
}

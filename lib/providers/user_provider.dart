import 'package:digital_earning/Helper/ui_helper.dart';
import 'package:digital_earning/services/api_services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class UserProvider extends ChangeNotifier {

  bool loading = false;
  List users = [];
  final apiServices = ApiServices();
  Map<String,dynamic> userData = {};


  Future<void> showUsers() async {
    try {
      loading = true;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        notifyListeners(); // Notify after the current frame
      });
      users = await apiServices.getRecordsWhere("users", "role", "user");

    }catch(error){
     print("Error $error");
    }finally {
      loading = false;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        notifyListeners(); // Notify after the current frame
      });
    }
  }

  Future<void> getUserInfo(BuildContext context) async {
    try {
      loading = true;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        notifyListeners(); // Notify after the current frame
      });

      String? id =  FirebaseAuth.instance.currentUser!.uid;
      userData = await apiServices.getRecordById("users", id);
    }catch(error){
      UiHelper.errorFlushMessage(context, "Error $error");
    }finally {
      loading = false;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        notifyListeners(); // Notify after the current frame
      });
    }
  }
}
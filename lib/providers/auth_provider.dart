import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:digital_earning/Helper/ui_helper.dart';
import 'package:digital_earning/screens/shared/auth_controller.dart';
import 'package:digital_earning/screens/shared/login_screen.dart';
import 'package:digital_earning/services/api_services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../Helper/app_exception.dart';


class AuthProvider extends ChangeNotifier {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final FirebaseAuth auth = FirebaseAuth.instance;
  bool loading = false;
  final apiServices = ApiServices();
  Future<void> register(BuildContext context,Map<String,dynamic> data) async {
    try {
      loading = true;
      notifyListeners();
      List<QueryDocumentSnapshot> ref = await apiServices.getRecordsWhere("users", "email", data['email']);
      if(ref.isNotEmpty) {
        UiHelper.errorFlushMessage(context, "User Already Exists");
      }else {
        UserCredential userCredential = await auth.createUserWithEmailAndPassword(email: data['email'], password: data['password']);
        User? user = userCredential.user;

        if(user != null) {
          await user.updateDisplayName(data['name']);
          Map<String,dynamic> userData = {
            'uid': user.uid,
            'name': data['name'],
            'email': data['email'],
            'birth': data['birth'],
            'gender': data['gender'],
            'phoneNumber': data['phoneNumber'],
            'whatsAppNumber': data['whatsAppNumber'],
            'cnic': data['cnic'],
            'promoId': data['promoId'],
            'role': 'user'
          };

          apiServices.addRecord("users", user.uid, userData).then((value){
            Navigator.pop(context);
            UiHelper.successFlushMessage(context, "Registration Successful");
            loading = false;
            notifyListeners();
          }).catchError((error){
            loading = false;
            notifyListeners();
            UiHelper.errorFlushMessage(context, "Registration Failed");
          });
        }
      }
    }on FirebaseAuthException catch(e) {
      if (e.code == 'email-already-in-use') {
        throw EmailAlreadyInUseException(e.message);
      } else if (e.code == 'invalid-email') {
        throw InvalidEmailException(e.message);
      } else if (e.code == 'weak-password') {
        throw WeakPasswordException(e.message);
      } else {
        throw UnknownFirebaseException(e.message);
      }
    }finally {
      loading = false;
      notifyListeners();
    }
  }

  Future<void> login(BuildContext context, String email, String password) async {
    try {
      loading = true;
      notifyListeners();
      QuerySnapshot ref = await firestore.collection("users").where("email", isEqualTo: email).get();
      if(ref.docs.isEmpty){
        UiHelper.errorFlushMessage(context, "User Not Found");
      }else{
        Map<String,dynamic> data = ref.docs.first.data() as Map<String,dynamic>;
        await auth.signInWithEmailAndPassword(email: email, password: password).then((value) async{
          await auth.currentUser!.updatePhotoURL(data['role']);
        }).catchError((error){

          if(error.code == "invalid-credential") {
            UiHelper.errorFlushMessage(context, "Invalid Credentials");
          }else{
            UiHelper.errorFlushMessage(context, 'error');
          }
        });
      }

    } on FirebaseAuthException catch (e) {
      print('Error is here ${e.code}');
      if (e.code == 'email-already-in-use') {
        throw EmailAlreadyInUseException(e.message);
      } else if (e.code == 'invalid-email') {
        throw InvalidEmailException(e.message);
      } else if (e.code == 'weak-password') {
        throw WeakPasswordException(e.message);
      } else {
        throw UnknownFirebaseException(e.message);
      }
    }finally{
      loading = false;
      notifyListeners();
    }
  }
  Future<void> logout(BuildContext context) async{

     auth.signOut().then((_){
      print("Successful");
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => AuthController(),),
          (route) => false);
    });
  }
}
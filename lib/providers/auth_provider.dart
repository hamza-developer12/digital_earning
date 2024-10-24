import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:digital_earning/Helper/ui_helper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

import '../Helper/app_exception.dart';


class AuthProvider extends ChangeNotifier {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final FirebaseAuth auth = FirebaseAuth.instance;
  bool loading = false;

  Future<void> register(BuildContext context,Map<String,dynamic> data) async {
    try {
      loading = true;
      notifyListeners();
      QuerySnapshot ref = await firestore.collection("users").where("email", isEqualTo: data['email']).get();
      if(ref.docs.first.exists) {
        UiHelper.errorFlushMessage(context, "User Already Exists");
      }else {
        UserCredential userCredential = await auth.createUserWithEmailAndPassword(email: data['email'], password: data['password']);
        User? user = userCredential.user;

        if(user != null) {
          await user.updateDisplayName(data['name']);
          await firestore.collection("users").doc(user.uid).set({
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

  Future<void> login(String email, String password) async {

  }

  void logout() {

  }
}
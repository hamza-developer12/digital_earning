import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:digital_earning/Helper/ui_helper.dart';
import 'package:digital_earning/services/api_services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class PaymentProvider extends ChangeNotifier {
  bool loading = false;
  final apiServices = ApiServices();
  List paymentRequests = [];


  Future<void> getAllPayments() async {
    try {
      loading = true;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        notifyListeners(); // Notify after the current frame
      });
      paymentRequests = await apiServices.getRecordsWhere("payment_requests", "status", "pending");
    }catch(error){
      print("Error $error");
    }finally {
      loading = false;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        notifyListeners(); // Notify after the current frame
      });

    }
  }

  Future<void> requestPayment(BuildContext context, String method, String accountNumber, double amount) async {
    try {
      loading = true;
      notifyListeners();
      final docRef = FirebaseFirestore.instance.collection("payment_requests");
      String docId = docRef.doc().id;
      await apiServices.addRecord("payment_requests", docId,
        {
          "name": FirebaseAuth.instance.currentUser!.displayName,
          "email": FirebaseAuth.instance.currentUser!.email,
          "paymentMethod": method,
          "accountNumber": accountNumber,
          "amount": amount,
          "status": "pending",
          "id": docId,
          "createdAt": DateTime.now(),
        }
      );
      UiHelper.successFlushMessage(context, "Payment Request Sent");
    }catch (error){
      UiHelper.errorFlushMessage(context, "Error: $error");
    }finally {
      loading = false;
      notifyListeners();
    }
  }

  Future<void> approveRequest(BuildContext context, String id) async {
    try {
      await apiServices.updateRecordById("payment_requests", id, {
        "status": "approved"
      });
      Navigator.pop(context);
      UiHelper.successFlushMessage(context, "Record Updated Successfully");

    }catch (error) {
      UiHelper.errorFlushMessage(context, "Error $error");
    }
  }
  Future<void> declineRequest(BuildContext context, String id) async {
    try {
      await apiServices.updateRecordById("payment_requests", id, {
        "status": "rejected"
      });
      Navigator.pop(context);
      UiHelper.successFlushMessage(context, "Record Updated Successfully");
    }catch (error) {
      UiHelper.errorFlushMessage(context, "Error $error");
    }
  }
}
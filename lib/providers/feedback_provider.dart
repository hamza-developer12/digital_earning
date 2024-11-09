import 'package:digital_earning/Helper/ui_helper.dart';
import 'package:digital_earning/services/api_services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class FeedbackProvider extends ChangeNotifier {
  bool loading = false;
  final apiServices = ApiServices();

  Future<void> sendFeedback(BuildContext context, double rating, String selectedOption, String message ) async {
    try {
      await apiServices.addRecord('feedbacks', '',
        {
          'feedbackCategory': selectedOption,
          'rating': rating,
          'message': message,
          'userEmail': FirebaseAuth.instance.currentUser!.email,
          'userName': FirebaseAuth.instance.currentUser!.displayName,
        }
      );
      UiHelper.successFlushMessage(context, "Thank You For Your Feedback");
    }catch(error){
      print(error);
      UiHelper.errorFlushMessage(context, "Something Went Wrong");
    }
  }
}
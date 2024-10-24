import 'package:digital_earning/constants/constants.dart';
import 'package:digital_earning/layouts/default_user_page_layout.dart';
import 'package:flutter/material.dart';
import 'package:rating_and_feedback_collector/rating_and_feedback_collector.dart';

class UserFeedbackScreen extends StatefulWidget {
  const UserFeedbackScreen({super.key});

  @override
  State<UserFeedbackScreen> createState() => _UserFeedbackScreenState();
}

class _UserFeedbackScreenState extends State<UserFeedbackScreen> {
  double _rating = 0.0;
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return DefaultUserPageLayout(
        backgroundColor: Colors.white,
        appBarBackgroundColor: Constants.color1,
        icon: Icons.feedback_outlined,
        screenName: "Your Feedback",
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: [
          
                SizedBox(height: height * 0.02,),
                const Divider(
                  color: Constants.color1,
                ),
                SizedBox(height: height * 0.02),
                const Text(
                  "We would like your feedback to improve our App.",
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "What is your opinion of this page?",
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: height * 0.02),
                RatingBar(
                  iconSize: 45, // Size of the rating icons
                  allowHalfRating: true,
                  filledIcon: Icons.star,
                  halfFilledIcon: Icons.star_half,
                  emptyIcon: Icons.star_border,
                  filledColor: Colors.amber,
                  emptyColor: Colors.grey,
                  currentRating: _rating,
                  onRatingChanged: (rating) {
                    setState(() {
                      _rating = rating;
                    });
                  },
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                const Divider(
                  color: Constants.color1,
                ),
                SizedBox(height: height * 0.02),
                const Text(
                  "Please select your feedback category below:",
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Suggestion"),
                      Spacer(),
                      Text("Report a bug"),
                      Spacer(),
                      Text("Compliment")
                    ],
                  ),
                ),
                SizedBox(height: height *0.02),
                Divider(
                  color: Constants.color1,
                ),
                SizedBox(
                  height: height *0.01,
                ),
                const Align(
                  alignment: Alignment.centerLeft,
                    child: Text("Please leave your feedback below"),
                ),
                SizedBox(height: height * 0.02),
                Container(
                  width: double.infinity,
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(width: 3, color: Color(0xFF00C3CC)),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: TextFormField(
                    maxLines: 4,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.all(10),
                      isDense: true,
                      hintText: 'Write your message here........',
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      focusedErrorBorder: InputBorder.none,
                    ),
                  ),
                ),
                SizedBox(height: height * 0.01),
                Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    width: 99,
                    padding: const EdgeInsets.all(12),
                    clipBehavior: Clip.antiAlias,
                    decoration: ShapeDecoration(
                      color: Color(0xFF00C3CC),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                    ),
                    child: Center(
                      child: Text("Send", style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                      ),),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
    );
  }
}

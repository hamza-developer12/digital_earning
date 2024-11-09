import 'package:digital_earning/constants/constants.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  String btnText;
  GestureTapCallback onTap;
  CustomButton({super.key, required this.btnText, required this.onTap});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Material(
      color: Colors.transparent,
      child: InkWell(
        splashColor:
        Colors.green.withOpacity(0.3), // Customize ripple color if needed
        borderRadius: BorderRadius.circular(10),
        onTap: onTap,
        child: Container(
          alignment: Alignment.center,
          width: width * 0.9,
          height: height * 0.055,
          decoration: BoxDecoration(
            border: Border.all(
              color: Constants.primaryColor,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
         child: Text(
           btnText,
           style: const TextStyle(
               fontSize: 18, letterSpacing: 3, color: Constants.primaryColor),
         ),
        ),
      ),
    );
  }
}

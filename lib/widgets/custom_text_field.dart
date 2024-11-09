import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType? textInputType;
  final String hintText;
  final FormFieldValidator<String> validator;
  final double? width;
  final bool? obscureText;
  final IconData? iconData; // Optional iconData

  CustomTextField({
    super.key,
    required this.controller,
    required this.hintText,
    this.width,
    required this.validator,
    this.textInputType = TextInputType.text,
    this.obscureText = false,
    this.iconData, // Optional iconData
  });

  @override
  Widget build(BuildContext context) {
    double initialWidth = MediaQuery.of(context).size.width;
    return SizedBox(
      width: width ?? initialWidth * 0.9,
      child: TextFormField(
        controller: controller,
        validator: validator,
        keyboardType: textInputType,
        obscureText: obscureText as bool,
        decoration: InputDecoration(
          hintText: hintText,
          suffixIcon: iconData != null ? Icon(iconData) : null, // Icon inside the TextFormField
          hintStyle: TextStyle(
            color: Colors.grey[500],
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
              color: Colors.grey[500]!,
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
              color: Colors.grey[500]!,
            ),
          ),
        ),
      ),
    );
  }
}

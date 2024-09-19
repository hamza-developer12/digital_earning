import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  TextEditingController controller;
  FormFieldValidator<String> validator;
  CustomTextField({super.key, required this.controller, required this.validator});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
    );
  }
}

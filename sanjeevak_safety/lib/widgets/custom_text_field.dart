import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {

  final String hint;
  final IconData icon;
  final TextInputType inputType;
  final bool isPassword;
  final FormFieldValidator<String>? validator;
  final TextEditingController controller;
  const CustomTextField({super.key,

    required this.hint,
    required this.icon,
    required this.inputType,
    this.isPassword = false,
    this.validator, required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: inputType,
      obscureText: isPassword,
      controller: controller,
      decoration: InputDecoration(

        hintText: hint,
        prefixIcon: Icon(icon),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      validator: validator,
    );
  }
}

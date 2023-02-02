import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({
    Key? key,
    required this.nameController,
    this.label,
    this.textInputType = TextInputType.text,
    this.isObsucreType=false,
  }) : super(key: key);

  final TextEditingController? nameController;
  final String? label;
  final TextInputType? textInputType;
  final bool isObsucreType;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: nameController,
      keyboardType: textInputType,
      obscureText: isObsucreType,
      style:const TextStyle(
        color: Colors.amber,
      ),
      decoration: InputDecoration(
        labelStyle: const TextStyle(
          color: Colors.amber,
        ),
        labelText: label,
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.amber),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.amber),
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  String textLabel;
  String hint;
  IconButton? iconSuffix;
  IconData iconPrefix;
  TextInputType inputFieldType;
  bool obsecuredText = false;

  TextFieldWidget(
      {required this.obsecuredText,
      @required this.iconSuffix,
      required this.inputFieldType,
      required this.iconPrefix,
      required this.hint,
      required this.textLabel});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: TextFormField(
        obscureText: obsecuredText,
        keyboardType: inputFieldType,
        decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          labelText: textLabel,
          labelStyle: const TextStyle(
              fontSize: 20, color: Color.fromARGB(255, 11, 76, 216)),
          hintText: hint,
          hintStyle: const TextStyle(
              fontSize: 20, color: Color.fromARGB(255, 11, 76, 216)),
          suffixIcon: iconSuffix,
          prefixIcon: Icon(
            iconPrefix,
            color: const Color.fromARGB(255, 11, 76, 216),
          ),
        ),
      ),
    );
  }
}

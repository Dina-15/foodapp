import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({super.key, this.hintText, this.onChanged, required this.KeyBoardType});
  String? hintText;
  TextInputType KeyBoardType;
  Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      keyboardType: KeyBoardType,
      validator: (data) {
        if (data!.isEmpty) return "This field is required";
        return null;
      },
      decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(horizontal: 20),
          hintText: '  $hintText',
          hintStyle: const TextStyle(color: Colors.grey, fontSize: 20, height: 3),
          filled: true,
          fillColor: Colors.grey[250],
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: BorderSide(style: BorderStyle.solid,
              color: Colors.grey[300]!,
            ),
          ),
        focusedBorder:  OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: BorderSide(style: BorderStyle.solid,
            color: Colors.grey[300]!,
          ),
        ),
        errorBorder:  OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: const BorderSide(style: BorderStyle.solid,
            color: Colors.red,
          ),
        ),
      ),
    );
  }
}

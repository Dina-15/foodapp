import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({super.key, this.hintText, this.onChanged});
  String? hintText;
  Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      validator: (data) {
        if (data!.isEmpty) return "This field is requried";
        return null;
      },
      decoration: InputDecoration(
          hintText: '  $hintText',
          hintStyle: const TextStyle(color: Colors.grey),
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
          borderSide: BorderSide(
            color: Colors.grey[300]!,
          ),
        ),
        errorBorder:  OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: const BorderSide(
            color: Colors.red,
          ),
        ),
      ),
    );
  }
}

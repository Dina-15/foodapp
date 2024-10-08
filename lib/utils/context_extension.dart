import 'package:flutter/material.dart';

extension contextExtension on BuildContext{
void showSnackBar(String message)
{
  ScaffoldMessenger.of(this).showSnackBar(
    SnackBar(content: Text(message),
    ),
  );
}
}
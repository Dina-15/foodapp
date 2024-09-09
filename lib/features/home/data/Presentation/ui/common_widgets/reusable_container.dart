import 'package:flutter/material.dart';

import '../../../../../../utils/constants.dart';

class ReusableContainer extends StatelessWidget {
  const ReusableContainer({super.key, required this.text, required this.color,required this.width});
  final String text;
  final Color color;
  final double width;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: width,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: color),
      child: Text(
        text,
        style: const TextStyle(fontSize: 22, color: Colors.white),
      ),
    );
  }
}

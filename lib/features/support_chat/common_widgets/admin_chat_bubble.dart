import 'package:flutter/material.dart';
import 'package:foodapp/utils/constants.dart';

class AdminChatBubble extends StatelessWidget {
  AdminChatBubble({super.key, required this.message});
  String message;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        padding: EdgeInsets.all(20),
        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Text(message,
          style: TextStyle(fontSize: 18, color: Colors.black),),
        decoration: BoxDecoration(
            color: Colors.grey[300] ,
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(20),
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            )
        ),
      ),
    );
  }
}

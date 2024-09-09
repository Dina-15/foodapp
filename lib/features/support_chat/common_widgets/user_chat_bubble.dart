import 'package:flutter/material.dart';
import 'package:foodapp/utils/constants.dart';

class UserChatBubble extends StatelessWidget {
  UserChatBubble({super.key, required this.message});
  String message;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        padding: EdgeInsets.all(20),
        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Text(message,
          style: TextStyle(fontSize: 18, color: Colors.white),),
        decoration: BoxDecoration(
          color: kPrimaryColor,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20),
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          )
        ),
      ),
    );
  }
}

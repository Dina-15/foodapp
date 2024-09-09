
import 'package:foodapp/models/message.dart';

abstract class ChatStates {}

class InitialState extends ChatStates {}

class ChatSuccess extends ChatStates {
  List<Message> messagesList;
  ChatSuccess(this.messagesList);
}

class ChatFailure extends ChatStates {
  String? errMessage;
  ChatFailure(errMessage);
}
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodapp/cubits/chat_cubit/chat_states.dart';
import 'package:foodapp/models/message.dart';
import '../../utils/constants.dart';

class ChatCubit extends Cubit<ChatStates> {
  ChatCubit() : super(InitialState());

  CollectionReference messages =
      FirebaseFirestore.instance.collection(kMessagesCollection);

  Future<void> sendMessage(Message message) async {
    try {
      await FirebaseFirestore.instance
          .collection(kMessagesCollection)
          .add(message.toJson());
    } on FirebaseException catch (e) {
      emit(ChatFailure(e.toString()));
    }
  }

  Future<void> getMessages() async {
    messages.orderBy('date', descending: true).snapshots().listen((event) {
      List<Message> messagesList = [];
      // messagesList.clear();
      for (var doc in event.docs) {
        messagesList.add(Message.fromJson(doc));
      }
      emit(ChatSuccess(messagesList));
    });
  }
}

import 'package:flutter/material.dart';
import 'package:foodapp/models/message.dart';
import 'package:foodapp/widgets/admin_chat_bubble.dart';
import '../constants.dart';
import '../widgets/user_chat_bubble.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatScreen extends StatelessWidget {
   ChatScreen({super.key});
   
   var scrollController = ScrollController(); 
   TextEditingController _controller = TextEditingController();
  CollectionReference messages = FirebaseFirestore.instance.collection(kMessagesCollection);
  @override
  Widget build(BuildContext context) {
    var email = ModalRoute.of(context)!.settings.arguments ?? "";
    return StreamBuilder<QuerySnapshot>(
      stream: messages.orderBy('date', descending: true).snapshots(),
      builder:(context, snapshot) {
        if(snapshot.hasData){
          List<Message> messageList = [];
          for(int i = 0; i< snapshot.data!.docs.length; i++)
            {
              messageList.add(Message.fromJson(snapshot.data!.docs[i]));
            }
       return Scaffold(
        appBar: AppBar(
          backgroundColor: kPrimaryColor,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back)),
        ),
        body: Column(
          children: [
            Expanded(
                child: ListView.builder(
                  reverse: true,
                 itemCount: messageList.length,
                 itemBuilder: (context, index)
                {
                  return messageList[index].id == email ?
                    UserChatBubble(message: messageList[index].message): AdminChatBubble(message: messageList[index].message);
                }
                )
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 20),
              child: TextField(
                controller: _controller,
                onSubmitted: (data)
                {
                  messages.add({
                    'message': data,
                    'date': DateTime.now(),
                    'id' : email
                  });
                  _controller.clear();
                  scrollController.animateTo(0
                  , duration: Duration(seconds: 3),
                    curve: Curves.easeIn
                  );
                },
                decoration: InputDecoration(
                  hintText: '   Type here...',
                  hintStyle: const TextStyle(color: Color(0xffDBDADA),),
                  suffixIcon: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.telegram,
                      color: kPrimaryColor,
                      size: 45,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(
                        color: kPrimaryColor,
                        width: 2,
                      )),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(color: kPrimaryColor,
                        width: 2,
                      )),
                ),
              ),
            ),
          ],
        ),
      );
        }
        else {
          return const Center(child: CircularProgressIndicator());
        }
      }
    );
  }

}

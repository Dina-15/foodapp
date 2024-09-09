import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodapp/cubits/chat_cubit/chat_cubit.dart';
import 'package:foodapp/cubits/chat_cubit/chat_states.dart';
import 'package:foodapp/models/message.dart';
import '../../../utils/constants.dart';
import '../common_widgets/admin_chat_bubble.dart';
import '../common_widgets/user_chat_bubble.dart';

class ChatScreen extends StatelessWidget {
  ChatScreen({super.key});
  static String id = 'ChatScreen';
  var scrollController = ScrollController();
  TextEditingController _controller = TextEditingController();
  List<Message> messagesList =[];
  @override
  Widget build(BuildContext context) {
    var email = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        elevation: 3,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back)),
      ),
      body: Column(
        children: [
          Expanded(
            child: BlocConsumer<ChatCubit, ChatStates>(
              listener:  (context, state) {
                if(state is ChatSuccess)
                  {
                    messagesList = state.messagesList;
                  }
              },
                builder: (context, state) {
                  return ListView.builder(
                      controller: scrollController,
                      reverse: true,
                      itemCount: messagesList.length,
                      itemBuilder: (context, index) {
                        return messagesList[index].id == email
                          ? UserChatBubble(message: messagesList[index].message)
                          : AdminChatBubble(message: messagesList[index].message);

                        // return messagesList[index].id == kAdminEmail
                        //     ? AdminChatBubble(message: messagesList[index].message)
                        //     : UserChatBubble(message: messagesList[index].message);


                      });
                }
                ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 20),
            child: TextField(
              controller: _controller,
              onSubmitted: (data) {
                BlocProvider.of<ChatCubit>(context).sendMessage(
                    Message(message: data,
                        id: email,
                        date: DateTime.now().toString()));
                _controller.clear();
                scrollController.animateTo(0,
                    duration: Duration(seconds: 2), curve: Curves.easeIn);
              },
              decoration: InputDecoration(
                hintText: '   Type here...',
                hintStyle: const TextStyle(
                  color: Color(0xffDBDADA),
                ),
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
                    borderSide: const BorderSide(
                      color: kPrimaryColor,
                      width: 2,
                    )),
              ),
            ),
          ),
        ],
      ),
    );
}
}
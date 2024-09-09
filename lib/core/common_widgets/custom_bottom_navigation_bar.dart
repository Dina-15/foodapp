import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodapp/cubits/chat_cubit/chat_cubit.dart';
import 'package:foodapp/features/home/data/Presentation/ui/screens/login_screen.dart';
import 'package:foodapp/features/support_chat/screens/chat_screen.dart';
import 'package:foodapp/utils/constants.dart';

import '../../cubits/logout_cubit/logout_cubit.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({super.key, required this.email});
  final String email;
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
        surfaceTintColor: Colors.white,
        shadowColor: Colors.black,
        elevation: 1,
        notchMargin: 12,
        height: 64,
        shape: const CircularNotchedRectangle(),
        color: kPrimaryColor,
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          IconButton(
            onPressed: () async{
              await BlocProvider.of<LogoutCubit>(context).logoutUser();
            },
            icon: const Icon(
              Icons.logout_outlined,
              color: Colors.white,
              size: 35,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.person,
              color: Colors.white,
              size: 35,
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          IconButton(
            onPressed: () async{
              await BlocProvider.of<ChatCubit>(context).getMessages();
              Navigator.of(context).pushNamed(ChatScreen.id, arguments: email);
            },
            icon:const Icon(
              Icons.chat_rounded,
              color: Colors.white,
              size: 35,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon:const Icon(
              Icons.favorite,
              color: Colors.white,
              size: 35,
            ),
          )
        ]));
  }
}

import 'package:flutter/material.dart';
import 'package:foodapp/features/home/data/Presentation/ui/screens/home_view.dart';
import 'package:foodapp/utils/constants.dart';

class CustomFloatingActionButton extends StatelessWidget {
  const CustomFloatingActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(onPressed: (){
      Navigator.of(context).pushNamed(HomeView.id);
    },
      shape: const CircleBorder(),
      backgroundColor: kPrimaryColor,
      child: const Icon(Icons.home_filled, color: Colors.white,size: 32,),
    );
  }
}

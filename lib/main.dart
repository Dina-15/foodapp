import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodapp/cubits/login_cubit/login_cubit.dart';
import 'package:foodapp/features/home/data/Presentation/ui/screens/details_view.dart';
import 'package:foodapp/features/home/data/Presentation/ui/screens/home_view.dart';
import 'package:foodapp/features/support_chat/screens/chat_screen.dart';
import 'package:foodapp/features/home/data/Presentation/ui/screens/login_screen.dart';
import 'package:foodapp/features/home/data/Presentation/ui/screens/sign_up_screen.dart';
import 'cubits/chat_cubit/chat_cubit.dart';
import 'cubits/logout_cubit/logout_cubit.dart';
import 'cubits/sign_up_cubit/sign_up_cubit.dart';
import 'features/splash/presentation/views/splash_view.dart';
import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers:[
        BlocProvider(create: (context)=> LoginCubit(),),
        BlocProvider(create: (context)=> SignUpCubit(),),
        BlocProvider(create: (context)=> ChatCubit(),),
        BlocProvider(create: (context)=> LogoutCubit(),),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.light(),
        routes: {
          LogInScreen.id: (context)=> LogInScreen(),
          SignUpScreen.id: (context)=> SignUpScreen(),
          ChatScreen.id: (context)=> ChatScreen(),
          DetailsView.id: (context)=> const DetailsView(),
          HomeView.id:(context)=>  HomeView(),
          SplashView.id: (context)=> const SplashView(),
        },
        initialRoute: SplashView.id,
         // home: const HomeView(),
         // home: const SplashView(),
      ),
    );
  }
}
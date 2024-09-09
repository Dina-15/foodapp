import 'package:flutter/material.dart';
import 'package:foodapp/utils/constants.dart';
import '../../../home/data/Presentation/ui/screens/login_screen.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});
  static String id = 'SplashView';
  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> with SingleTickerProviderStateMixin{

  late AnimationController animationController ;
  late Animation<Offset> slidingAnimation;

  @override
  void initState() {
    super.initState();
    initSlidingAnimation();
    navigateToHome();
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Container(
        decoration: const BoxDecoration(gradient:LinearGradient(
          begin: Alignment.bottomRight,
            end: Alignment.topCenter,
        colors:
        [
          kPrimaryColor,
          Color(0xffEF2A39),
          Color(0xffFF939B),
        ]
        )),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            AnimatedBuilder(
              animation: slidingAnimation,
              builder:(context, child)
              =>SlideTransition(
                position: slidingAnimation,
                child: const Text('Foodgo',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontFamily: "Lobster",
                      color: Colors.white, fontSize: 60),),
              ),
            ),
            const SizedBox(height: 200,),
            Align(
              alignment: Alignment.centerLeft,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Image.asset("assets/images/largeBurgur.png", height: 250,width: 250,alignment: Alignment.centerLeft,),
                  Positioned(
                    left: 120,
                      bottom: -15,
                      child: Image.asset("assets/images/veggleBurgur.png",
                        height: 200, width: 200,))
                ],
              ),
            ),
          ],
        ),
      )
    );
  }
  void initSlidingAnimation() {
    animationController = AnimationController(vsync: this, duration: const Duration(seconds: 1));
    slidingAnimation = Tween<Offset>(begin: const Offset(0, -4), end: Offset.zero).animate(animationController);
    animationController.forward();
  }

  navigateToHome()
  {
    Future.delayed(const Duration(seconds: 5), (){
      Navigator.pushNamed(context, LogInScreen.id);
    });
  }
}

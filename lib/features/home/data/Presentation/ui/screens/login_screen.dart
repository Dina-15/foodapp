import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodapp/cubits/login_cubit/login_cubit.dart';
import 'package:foodapp/features/home/data/Presentation/ui/screens/sign_up_screen.dart';
import 'package:foodapp/utils/context_extension.dart';
import 'package:foodapp/core/common_widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../../../../../../utils/constants.dart';
import 'package:foodapp/features/home/data/Presentation/ui/screens/home_view.dart';

class LogInScreen extends StatelessWidget {
  LogInScreen({super.key});

  final GlobalKey<FormState> _key = GlobalKey();
  static String id = "LogInScreen";
  String? email;
  String? password;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginStates>(
      listener: (context, state)
      {
        if(state is LoginLoading) {
          isLoading = true;
        } else if(state is LoginSuccess) {
          isLoading = false;
          context.showSnackBar('User Logged In Successfully!');
          Navigator.pushNamed(context, HomeView.id, arguments: email);
        } else if(state is LoginFailure) {
          isLoading = false;
          context.showSnackBar(state.message);
        }
      },
      builder:(context, state)=> ModalProgressHUD(
        inAsyncCall: isLoading,
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Form(
              key: _key,
              child: SingleChildScrollView(
                  child: Container(
                color: kPrimaryColor,
                child: Column(
                  children: [
                    Image.asset(
                      'assets/images/bgBurgur.png',
                      height: 200,
                      width: 350,
                    ),
                    Container(
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(25),
                              topLeft: Radius.circular(25))),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 50,
                            ),
                            const Text(
                              "Login",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 40,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text(
                              "Add your details to login",
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 20,
                              ),
                            ),
                            const SizedBox(
                              height: 50,
                            ),
                            CustomTextField(
                              hintText: "Email",
                              KeyBoardType: TextInputType.emailAddress,
                              onChanged: (data) {
                                email = data;
                              },
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            CustomTextField(
                                hintText: "Password",
                                KeyBoardType: TextInputType.visiblePassword,
                                onChanged: (data) {
                                  password = data;
                                }),
                            const SizedBox(
                              height: 50,
                            ),
                            ElevatedButton(
                              onPressed: ()async {
                                if (_key.currentState!.validate()) {
                                  await context.read<LoginCubit>().loginUser(email: email, password: password);
                                }
                              },
                              style: ButtonStyle(
                                padding: WidgetStateProperty.all(
                                    const EdgeInsets.symmetric(
                                        horizontal: 145, vertical: 15)),
                                backgroundColor:
                                    WidgetStateProperty.all(kPrimaryColor),
                              ),
                              child: const Text(
                                "Login",
                                style: TextStyle(color: Colors.white,
                                    fontSize: 20),
                              ),
                            ),
                            const SizedBox(
                              height: 175,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  "Don't have an Account? ",
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 20,
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.pushNamed(context, SignUpScreen.id);
                                  },
                                  child: const Text(
                                    " Sign Up",
                                    style: TextStyle(
                                      color: kPrimaryColor,
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                           const SizedBox(height: 15,)
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              ),
          ),
        ),
      ),
    );
  }
}

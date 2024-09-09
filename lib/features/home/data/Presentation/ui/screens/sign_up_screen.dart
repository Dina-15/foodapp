import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodapp/cubits/sign_up_cubit/sign_up_cubit.dart';
import 'package:foodapp/features/home/data/Presentation/ui/screens/home_view.dart';
import 'package:foodapp/models/user_model.dart';
import 'package:foodapp/utils/context_extension.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../../../../../../core/common_widgets/custom_text_field.dart';
import '../../../../../../utils/constants.dart';

class SignUpScreen extends StatelessWidget {
  static String id = "RegisterScreen";
  final GlobalKey<FormState> _key = GlobalKey();
  final UserModel newUser = UserModel();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignUpCubit, SignUpStates>(
      listener: (context, state) async {
        if (state is LoadingState) {
          isLoading = true;
        } else if (state is SignUpSuccess) {
          await context.read<SignUpCubit>().createUser(newUser);
        } else if (state is createUserSuccess) {
          context.showSnackBar('User Registered Successfully!');
          isLoading = false;
          Navigator.pushNamed(context, HomeView.id, arguments: newUser.email);
        } else if (state is SignUpFailure) {
          isLoading = false;
          context.showSnackBar(state.message);
        }
        else if(state is createUserFailure)
          {
            isLoading = false;
            context.showSnackBar(state.message);
          }
      },
      builder: (context, state) => ModalProgressHUD(
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
                                height: 20,
                              ),
                              const Text(
                                "Sign Up",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 40,
                                ),
                              ),
                              const Text(
                                "Add your details to sign up",
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 20,
                                ),
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              CustomTextField(
                                hintText: "Name",
                                KeyBoardType: TextInputType.name,
                                onChanged: (data) {
                                  newUser.name = data;
                                },
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              CustomTextField(
                                hintText: "Email",
                                KeyBoardType: TextInputType.emailAddress,
                                onChanged: (data) {
                                  newUser.email = data;
                                },
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              CustomTextField(
                                hintText: "Phone Number",
                                KeyBoardType: TextInputType.phone,
                                onChanged: (data) {
                                  newUser.phone = data;
                                },
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              CustomTextField(
                                hintText: "Address",
                                KeyBoardType: TextInputType.streetAddress,
                                onChanged: (data) {
                                  newUser.address = data;
                                },
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              CustomTextField(
                                  hintText: "Password",
                                  KeyBoardType: TextInputType.visiblePassword,
                                  onChanged: (data) {
                                    newUser.password = data;
                                  }),
                              const SizedBox(
                                height: 30,
                              ),
                              ElevatedButton(
                                onPressed: () async {
                                  if (_key.currentState!.validate()) {
                                    await context
                                        .read<SignUpCubit>()
                                        .signUpUser(
                                            email: newUser.email,
                                            password: newUser.password);
                                  }
                                },
                                style: ButtonStyle(
                                  padding: WidgetStateProperty.all(
                                      const EdgeInsets.symmetric(
                                          horizontal: 135, vertical: 15)),
                                  backgroundColor:
                                      WidgetStateProperty.all(kPrimaryColor),
                                ),
                                child: const Text(
                                  "Sign Up",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                ),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    "Already have an account? ",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                    child: const Text(
                                      "Login",
                                      style: TextStyle(
                                        color: kPrimaryColor,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 15,
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )),
    );
  }
}

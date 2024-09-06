import 'package:foodapp/screens/register_screen.dart';
import 'package:foodapp/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../constants.dart';

class LogInScreen extends StatefulWidget {
  LogInScreen({super.key});
  static String id = "LogInScreen";

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  GlobalKey<FormState> _key = GlobalKey();

  String? email;
  String? password;
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
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
                    height: 210,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(25),
                            topLeft: Radius.circular(25))),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 35),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 80,
                          ),
                          Text(
                            "Login",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 40,
                            ),
                          ),
                          Text(
                            "Add your details to login",
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 20,
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          CustomTextField(
                            hintText: "Email",
                            onChanged: (data) {
                              email = data;
                            },
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          CustomTextField(
                              hintText: "Password",
                              onChanged: (data) {
                                password = data;
                              }),
                          const SizedBox(
                            height: 50,
                          ),
                          ElevatedButton(
                            onPressed: () async {
                              if (_key.currentState!.validate()) {
                                setState(() {
                                  isLoading = true;
                                });
                                try {
                                  UserCredential user = await FirebaseAuth
                                      .instance
                                      .createUserWithEmailAndPassword(
                                          email: email!, password: password!);
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content: Text(
                                              "User Logged In Successfully!")));
                                } on FirebaseAuthException catch (e) {
                                  if (e.code == 'weak password') {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        const SnackBar(
                                            content: Text("Weak Password!")));
                                  } else if (e.code == 'email-already-in-use') {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        const SnackBar(
                                            content: Text(
                                                "This Email Already Exists")));
                                  }
                                }
                                setState(() {
                                  isLoading = false;
                                });
                              }
                            },
                            style: ButtonStyle(
                              padding: WidgetStateProperty.all(
                                  const EdgeInsets.symmetric(
                                      horizontal: 140, vertical: 15)),
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
                                  Navigator.pushNamed(context, RegisterScreen.id);
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
    );
  }
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../constants.dart';
import '../widgets/custom_text_field.dart';

class RegisterScreen extends StatefulWidget {
  RegisterScreen({super.key});
  static String id = "RegisterScreen";

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
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
                            SizedBox(height: 20,),
                            Text(
                              "Sign Up",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 40,
                              ),
                            ),
                            Text(
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
                              onChanged: (data) {
                                email = data;
                              },
                            ),
                            const SizedBox(
                              height: 20,
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
                              hintText: "Phone Number",
                              onChanged: (data) {
                                email = data;
                              },
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            CustomTextField(
                              hintText: "Address",
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
                              height: 40,
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
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(const SnackBar(
                                        content: Text(
                                            "User Registered Successfully!")));
                                  } on FirebaseAuthException catch (e) {
                                    if (e.code == 'weak password') {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(const SnackBar(
                                          content: Text("Weak Password!")));
                                    }
                                    else if (e.code == 'email-already-in-use') {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(const SnackBar(
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
                                        horizontal: 130, vertical: 15)),
                                backgroundColor: WidgetStateProperty.all(
                                    kPrimaryColor),
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
                            SizedBox(height: 15,)
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        )
    );
  }
}
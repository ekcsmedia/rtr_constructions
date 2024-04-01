import 'package:flutter/material.dart';
import 'package:sattva_rtr_construction_split_wise/views/common_widgets/button_widget.dart';
import 'package:sattva_rtr_construction_split_wise/views/common_widgets/logo_container.dart';

import '../common_widgets/text_field_widget.dart';

class LoginInput extends StatefulWidget {
  const LoginInput({super.key});

  @override
  State<LoginInput> createState() => _LoginInputState();
}

class _LoginInputState extends State<LoginInput> {
  bool isSignUp = false;
  bool otpScreen = false;
  String phone = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.black12,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            const LogoContainer(
              name: 'images/placeholder-logo.png',
              width: 400,
              height: 200,
            ),
            Visibility(
              visible: !otpScreen,
              replacement: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    Text("Verification code sent to phone: +91 $phone", style:
                      const TextStyle(
                        color: Colors.red
                      ),),
                    const SizedBox(
                      height: 30,
                    ),
                    const SizedBox(
                      width: 180,
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "Enter Verification Code",
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ButtonWidget(
                          color: Colors.green,
                          width: 80,
                          data: "SUBMIT",
                          onTap: () {
                          },
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        ButtonWidget(
                          color: Colors.purple,
                          width: 80,
                          data: "RESEND",
                          onTap: () {
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Visibility(
                      visible: isSignUp,
                      child: const Column(
                        children: [
                          SizedBox(
                            height: 30,
                          ),
                          TextFieldWidget(
                            width: 250,
                            height: 50,
                            hintText: "Name",
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    const TextFieldWidget(
                      width: 250,
                      height: 50,
                      hintText: "Phone Number",
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    const TextFieldWidget(
                      width: 250,
                      height: 50,
                      hintText: "PIN",
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Visibility(
                      visible: !isSignUp,
                      replacement: Column(
                        children: [
                          ButtonWidget(
                            data: "GENERATE OTP",
                            width: 120,
                            height: 40,
                            onTap: () {
                              otpScreen = true;
                              setState(() {
                              });
                            },
                          ),
                          Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Text("Already have account?"),
                                TextButton(
                                  onPressed: () {
                                    isSignUp = false;
                                    setState(() {});
                                  },
                                  child: const Text("SignIn"),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      child: const ButtonWidget(
                        data: "LOGIN",
                        width: 80,
                        height: 40,
                      ),
                    ),
                    Visibility(
                      visible: !isSignUp,
                      child: const Padding(
                        padding: EdgeInsets.symmetric(vertical: 8),
                        child: Text("Create New Account ?"),
                      ),
                    ),
                    Visibility(
                      visible: !isSignUp,
                      child: TextButton(
                        onPressed: () {
                          isSignUp = true;
                          setState(() {});
                        },
                        child: const Text("Sign Up"),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

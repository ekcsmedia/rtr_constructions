import 'package:flutter/material.dart';
import 'package:sattva_rtr_construction_split_wise/views/common_widgets/button_widget.dart';
import 'package:sattva_rtr_construction_split_wise/views/common_widgets/logo_container.dart';

import '../common_widgets/text_field_widget.dart';

class LoginInput extends StatelessWidget {
  const LoginInput({this.isSignUp = false, super.key});

  final bool isSignUp;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.black12,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const LogoContainer(
              name: 'images/placeholder-logo.png',
              width: 400,
              height: 200,
            ),
            const SizedBox(
              height: 30,
            ),
            const TextFieldWidget(
              width: 200,
              height: 50,
              hintText: "Name",
            ),
            Visibility(
              visible: isSignUp,
              child: const Column(
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  TextFieldWidget(
                    width: 200,
                    height: 50,
                    hintText: "Phone Number",
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            const TextFieldWidget(
              width: 200,
              height: 50,
              hintText: "PIN",
            ),
            const SizedBox(
              height: 30,
            ),
            Visibility(
                    visible: !isSignUp,
                    replacement: const ButtonWidget(
                      data: "GENERATE OTP",
                      width: 120,
                      height: 40,
                    ),
                    child: const ButtonWidget(
                      data: "LOGIN",
                      width: 80,
                      height: 40,
                    ),
                  ),

            Visibility(
              visible: !isSignUp,
              child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 8),
                      child: Text("Create New Account ?"),
                    ),
            ),
            Visibility(
              visible:!isSignUp,
              child: InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const LoginInput(isSignUp: true)));
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
    );
  }
}

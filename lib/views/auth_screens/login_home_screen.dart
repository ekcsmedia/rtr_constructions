import 'package:flutter/material.dart';
import 'package:sattva_rtr_construction_split_wise/views/auth_screens/login_input_screen.dart';
import 'package:sattva_rtr_construction_split_wise/views/common_widgets/button_widget.dart';

class LoginHome extends StatelessWidget {
  const LoginHome({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset('images/icon_placeholder.png'),
        ),
        title: const Row(
          children: [
            Expanded(
                child: Row(
                  children: [
                    Text("RTR CONSTRUCTIONS"),
                  ],
                )),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(child:
            Image.asset('images/placeholder-logo.png')
          ),
          Container(
            width: double.infinity,
            height: 200,
            color: Colors.white,
            child:  Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ButtonWidget(
                  width: 130,
                  height: 40,
                  data: "LOGIN",
                  textStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16
                  ),
                  isLogo: true,
                  icon: Icons.double_arrow,
                  onTap:() {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => LoginInput())
                    );
                  },
                ),
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text("By logging in you agree to our terms and conditions"),
                ),
              ],
            ),
          )
        ],
      )
    );
  }
}

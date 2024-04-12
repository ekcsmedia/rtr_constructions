import 'package:flutter/material.dart';

import '../../auth_screens/login_input_screen.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 200,
        color: Colors.white,
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(
              width: 5,
            ),
            SizedBox(
              child: Container(
                width: 100,
                height: 50,
                color: Colors.blue,
                child: const Center(
                  child: Text("Logo"),
                ),
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            const SizedBox(
              width: 400,
              height: 70,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text("Santhosh Kumar S"),
                  Text("+91 8925450309"),
                ],
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            const SizedBox(
              width: 200,
              height: 70,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "You Gave",
                    style: TextStyle(color: Colors.redAccent),
                  ),
                  Text(
                    "\u{20B9} 100.0",
                    style: TextStyle(color: Colors.redAccent),
                  ),
                ],
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            const SizedBox(
              width: 200,
              height: 70,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "You Got",
                    style: TextStyle(color: Colors.greenAccent),
                  ),
                  Text(
                    "\u{20B9} 500.0",
                    style: TextStyle(color: Colors.greenAccent),
                  ),
                ],
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            Expanded(
              child: Container(
                color: Colors.blue[200],
                child: const TextField(
                  decoration: InputDecoration(
                    hintText: "37 Customers",
                    prefixIcon: Icon(Icons.search),
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            SizedBox(
                width: 30,
                height: 50,
                child: IconButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const LoginInput()));
                    },
                    icon: const Icon(Icons.logout))),
            const SizedBox(
              width: 5,
            ),
          ],
        ),
        ),
    );
  }
}

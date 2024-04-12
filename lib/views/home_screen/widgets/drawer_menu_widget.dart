import 'package:flutter/material.dart';

class DrawerMenuWidget extends StatelessWidget {
  const DrawerMenuWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      fit: FlexFit.tight,
      flex: 1,
      child: Container(
        color: Colors.blue[100],
        child: ListView(children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Material(
              child: ListTile(title: const Text("CUSTOMERS", style: TextStyle(
                fontWeight: FontWeight.bold,
              ),),
                tileColor: Colors.blue[700],),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Material(
              child: ListTile(title: const Text("SETTINGS"),
                tileColor: Colors.blue[500],),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Material(
              child: ListTile(title: const Text("ABOUT US"),
                tileColor: Colors.blue[500],),
            ),
          ),
        ]),
      ),
    );
  }
}

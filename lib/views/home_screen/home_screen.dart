import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.purple,
          title: SizedBox(
            height: 80,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  child: Container(
                    width: 100,
                    height: 50,
                    color: Colors.green,
                    child: Center(
                      child: Text("Logo"),
                    ),
                  ),
                ),
                SizedBox(
                  width: 50,
                ),
                SizedBox(
                  width: 100,
                  height: 70,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text("Name"),
                      Text("Phone"),
                    ],
                  ),
                ),
                SizedBox(
                  width: 50,
                ),
                SizedBox(
                  width: 100,
                  height: 70,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text("Rs.100.0"),
                      Text("You Gave"),
                    ],
                  ),
                ),
                SizedBox(
                  width: 50,
                ),
                SizedBox(
                  width: 100,
                  height: 70,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text("Rs.500.0"),
                      Text("You Got"),
                    ],
                  ),
                ),
                SizedBox(
                  width: 50,
                ),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Customer",
                      prefixIcon: Icon(Icons.search),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                SizedBox(
                  width: 50,
                ),
                SizedBox(width: 30, height: 50, child: Icon(Icons.logout)),
              ],
            ),
          ),
        ),
        body: Column(
          children: <Widget>[
            Expanded(
              child: Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Flexible(
                    fit: FlexFit.tight,
                    flex: 1,
                    child: ListView(children: <Widget>[
                      ListTile(title: Text("CUSTOMERS")),
                      ListTile(title: Text("SETTINGS")),
                      ListTile(title: Text("ABOUT US")),
                    ]),
                  ),
                  Flexible(
                    fit: FlexFit.tight,
                    flex: 6,
                    child: Container(
                      child: Center(child: Text('Content')),
                      color: Colors.black26,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}

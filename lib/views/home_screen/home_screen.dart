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
                    child: const Center(
                      child: Text("Logo"),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 50,
                ),
                const SizedBox(
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
                const SizedBox(
                  width: 50,
                ),
                const SizedBox(
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
                const SizedBox(
                  width: 50,
                ),
                const SizedBox(
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
                const SizedBox(
                  width: 50,
                ),
                const Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Customer",
                      prefixIcon: Icon(Icons.search),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 50,
                ),
                const SizedBox(width: 30, height: 50, child: Icon(Icons.logout)),
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
                    child: ListView(children: const <Widget>[
                      ListTile(title: Text("CUSTOMERS")),
                      ListTile(title: Text("SETTINGS")),
                      ListTile(title: Text("ABOUT US")),
                    ]),
                  ),
                  Flexible(
                    fit: FlexFit.tight,
                    flex: 6,
                    child: Container(
                      color: Colors.black26,
                      child: const Center(child: Text('Content')),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}

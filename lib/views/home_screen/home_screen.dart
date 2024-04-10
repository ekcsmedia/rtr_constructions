import 'package:flutter/material.dart';

import '../auth_screens/login_input_screen.dart';

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
          automaticallyImplyLeading: false,
          // backgroundColor: Colors.blue[800],
          title: Container(
            height: 200,
            color: Colors.white,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
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
                      Text("You Gave",style: TextStyle(
                        color: Colors.redAccent
                      ),),
                      Text("\u{20B9} 100.0",style: TextStyle(
                          color: Colors.redAccent
                      ),),
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
                      Text("You Got",style: TextStyle(
                          color: Colors.greenAccent
                      ),),
                      Text("\u{20B9} 500.0",style: TextStyle(
                          color: Colors.greenAccent
                      ),),

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
                SizedBox(width: 30, height: 50,
                    child: IconButton(
                        onPressed: () {
                          Navigator.of(context).push(
                              MaterialPageRoute(builder: (context) => const LoginInput())
                          );                        },
                      icon: const Icon(Icons.logout))),
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
                  ),
                  Flexible(
                    fit: FlexFit.tight,
                    flex: 4,
                    child: Container(
                      color: Colors.blue[50],
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemBuilder: (context, i) {
                          return Padding(
                            padding: const EdgeInsets.only(top: 5.0,left: 8.0,right: 8.0),
                            child: Material(
                              child: ListTile(
                                leading: Container(
                                  color: Colors.blue,
                                  height: 50,
                                  width: 50,
                                ),
                                title: const Text("Admin_Test"),
                                subtitle: const Text("admin"),
                                trailing: const Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("\u{20B9} 3000"),
                                    Text("You Got")
                                  ],
                                ),
                                contentPadding: const EdgeInsets.all(8),
                                tileColor: Colors.white,
                              ),
                            ),
                          );
                        }, itemCount: 30,),
                      ),
                    ),
                  ),
                  Flexible(
                    fit: FlexFit.tight,
                    flex: 2,
                    child: Container(
                      color: Colors.blue[100],
                      child: const Center(child: Text('Transactions Summary')),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}

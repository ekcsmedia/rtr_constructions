import 'package:flutter/material.dart';

import '../../common_widgets/text_field_widget.dart';

class CustomerListWidget extends StatefulWidget {
  const CustomerListWidget({super.key});

  @override
  State<CustomerListWidget> createState() => _CustomerListWidgetState();
}

class _CustomerListWidgetState extends State<CustomerListWidget> {
  bool isAddCustomers = false;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      fit: FlexFit.tight,
      flex: 4,
      child: Container(
        color: Colors.blue[50],
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: isAddCustomers ? 200 : 200,
                    child: ElevatedButton(
                      onPressed: () {
                        isAddCustomers = !isAddCustomers;
                        setState(() {});
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.purple[500]),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          isAddCustomers
                              ? const Icon(Icons.person_add, color: Colors.white)
                              : const Icon(Icons.people, color: Colors.white),
                          isAddCustomers
                              ?  const Text(
                            'SAVE DETAILS',
                            style: TextStyle(color: Colors.white),
                          ) :
                          const Text(
                            'ADD CUSTOMERS',
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: isAddCustomers
                    ? const Column(
                        children: [
                          SizedBox(
                            height: 30,
                          ),
                          TextFieldWidget(
                            width: 250,
                            height: 50,
                            hintText: "Name",
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          TextFieldWidget(
                            width: 250,
                            height: 50,
                            hintText: "Phone Number",
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          TextFieldWidget(
                            width: 250,
                            height: 50,
                            hintText: "PIN",
                          ),
                        ],
                      )
                    : ListView.builder(
                        shrinkWrap: true,
                        itemCount: 30,
                        itemBuilder: (context, i) {
                          return Padding(
                            padding: const EdgeInsets.only(
                                top: 5.0, left: 8.0, right: 8.0),
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
                        },
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

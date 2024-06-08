import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/utils.dart';

import '../../../controller/common_data_controller.dart';
import '../../../model/customer_model.dart';
import '../../../utils/utility_functions.dart';
import '../../common_widgets/text_field_widget.dart';
import 'package:firebase_database/firebase_database.dart';

class CustomerListWidget extends StatefulWidget {
  const CustomerListWidget({super.key});

  @override
  State<CustomerListWidget> createState() => _CustomerListWidgetState();
}

class _CustomerListWidgetState extends State<CustomerListWidget> {
  final CommonDataController _controller = Get.put(CommonDataController());

  bool isAddCustomers = false;
  final databaseRef = FirebaseDatabase.instance.ref();
  List<CustomerModel> _customers = [];

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _pinController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _fetchUsers();
  }

  void _fetchUsers() async {
    databaseRef.child('customers').onValue.listen((DatabaseEvent event) {
      final data = event.snapshot.value as Map<dynamic, dynamic>?;
      if (data != null) {
        setState(() {
          _customers = data.entries
              .map((e) =>
                  CustomerModel.fromJson(Map<String, dynamic>.from(e.value)))
              .toList();
          _controller.setCustomerTotal(_customers.length);
        });
      }
    });
  }

  void _saveUserData() {
    String name = _nameController.text;
    String phone = _phoneController.text;
    String pin = _pinController.text;

    if (name.isEmpty || phone.isEmpty || pin.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Enter all fields'),
      ));
      return;
    } else {
      CustomerModel customer =
          CustomerModel(name: name, loginPin: phone, phone: pin);

      databaseRef.child('customers').push().set(customer.toJson()).then((_) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Successfully Added'),
        ));
      }).catchError((error) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Failed to add data: $error'),
        ));
      });
      isAddCustomers = false;
      setState(() {});
    }
  }

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
              const SizedBox(
                height: 10,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Visibility(
                        visible: isAddCustomers,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                              width: 100,
                              child: ElevatedButton(
                                  onPressed: () {
                                    isAddCustomers = !isAddCustomers;
                                    setState(() {});
                                  },
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.white),
                                  child: const Text("Cancel",
                                    style: TextStyle(color: Colors.purple),
                                  ))),
                        ),
                      ),
                      SizedBox(
                        width: isAddCustomers ? 200 : 200,
                        child: ElevatedButton(
                          onPressed: () {
                            if (isAddCustomers) {
                              _saveUserData();
                            } else {
                              isAddCustomers = !isAddCustomers;
                              setState(() {});
                            }
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.purple[500]),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              isAddCustomers
                                  ? const Icon(Icons.person_add,
                                      color: Colors.white)
                                  : const Icon(Icons.people,
                                      color: Colors.white),
                              isAddCustomers
                                  ? const Text(
                                      'SAVE DETAILS',
                                      style: TextStyle(color: Colors.white),
                                    )
                                  : const Text(
                                      'ADD CUSTOMERS',
                                      style: TextStyle(color: Colors.white),
                                    ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: isAddCustomers
                    ? Column(
                        children: [
                          const SizedBox(
                            height: 30,
                          ),
                          TextFieldWidget(
                            width: 250,
                            height: 50,
                            hintText: "Name",
                            controller: _nameController,
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          TextFieldWidget(
                            width: 250,
                            height: 50,
                            hintText: "Phone Number",
                            controller: _phoneController,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly
                            ],
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          TextFieldWidget(
                            width: 250,
                            height: 50,
                            hintText: "PIN",
                            controller: _pinController,
                          ),
                        ],
                      )
                    : ListView.builder(
                        shrinkWrap: true,
                        itemCount: _customers.length,
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
                                  child: Center(
                                    child: Text(
                                      (_customers[i].name == null ||
                                              _customers[i].name!.isEmpty)
                                          ? "--"
                                          : _customers[i]
                                              .name![0]
                                              .toUpperCase(),
                                      style: const TextStyle(
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ),
                                  ),
                                ),
                                title: Text((_customers[i].name == null ||
                                        _customers[i].name!.isEmpty)
                                    ? "--"
                                    : capitalizeEachWord(_customers[i].name!)),
                                subtitle: Text(_customers[i].admin ?? false
                                    ? "Admin"
                                    : "Customer"),
                                trailing: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("\u{20B9}"
                                        "${_customers[i].balance ?? "--"}"),
                                    const Text("You Got")
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

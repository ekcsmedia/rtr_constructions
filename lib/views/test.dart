import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

import '../model/attachment_model.dart';

class TestPage extends StatefulWidget {
  const TestPage({super.key});

  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  final databaseRef = FirebaseDatabase.instance.ref();
  final TextEditingController _controller = TextEditingController();
  List<AttachmentsModel> _attachments = [];

  @override
  void initState() {
    super.initState();
    _fetchUsers();
  }

  void _fetchUsers() {
    databaseRef.child('attachments').onValue.listen((DatabaseEvent event) {
      final data = event.snapshot.value as Map<dynamic, dynamic>?;
      if (data != null) {
        setState(() {
          _attachments = data.entries.map((e) => AttachmentsModel.fromJson(Map<String, dynamic>.from(e.value))).toList();
        });
      }
    });
  }


  void _sendMessage() {
    if (_controller.text.isNotEmpty) {
      databaseRef.child('attachments').push().set(_controller.text);
      _controller.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Firebase Demo'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _attachments.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_attachments[index].filename ?? ""),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      labelText: 'Send a message',
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: _sendMessage,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

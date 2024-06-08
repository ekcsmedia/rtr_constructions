import 'package:flutter/material.dart';

class TransactionSummaryWidget extends StatelessWidget {
  const TransactionSummaryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      fit: FlexFit.tight,
      flex: 2,
      child: Container(
        color: Colors.blue[100],
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Container(
                height: 40,
                color: Colors.blue[200],
                child: const Padding(
                  padding: EdgeInsets.only(bottom: 4.0),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "2 Entries",
                      prefixIcon: Icon(Icons.search),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 60,
              child: Padding(
                padding: const EdgeInsets.only(top: 12.0),
                child: Row(
                  children: [
                    Flexible(
                      flex: 3,
                      fit: FlexFit.tight,
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.purple[500],
                            border: Border.all(color: Colors.blue)),
                        child: const Center(
                          child: Text("ENTRIES"),
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      fit: FlexFit.tight,
                      child: Container(
                        color: Colors.red,
                        child: const Center(
                          child: Text("YOU GAVE"),
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      fit: FlexFit.tight,
                      child: Container(
                        color: Colors.green,
                        child: const Center(
                          child: Text("YOU GOT"),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 3,
                itemBuilder: (context, i) {
                  return SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 100,
                    child: Row(
                      children: [
                        Flexible(
                          flex: 3,
                          fit: FlexFit.tight,
                          child: Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.grey[500],
                                  border: Border.all(color: Colors.blue)),
                              child: const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Tue Feb 27 00:38:48"),
                                    Text("admin_test"),
                                    Text("t2"),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        Flexible(
                          flex: 1,
                          fit: FlexFit.tight,
                          child: Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.red[200],
                                  border: Border.all(color: Colors.blue)),
                              child: const Center(
                                child: Text(
                                  "\u{20B9} 1000.0",
                                  style: TextStyle(color: Colors.red),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Flexible(
                          flex: 1,
                          fit: FlexFit.tight,
                          child: Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.green[200],
                                  border: Border.all(color: Colors.blue)),
                              child: const Center(
                                child: Text(
                                  "\u{20B9} 3000.0",
                                  style: TextStyle(color: Colors.green),
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  );
                },
                shrinkWrap: true,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                  child: const Text(
                    "YOU GAVE \u{20B9} ",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                ElevatedButton(
                  onPressed: () {},
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.green),
                  child: const Text(
                    "YOU GOT \u{20B9} ",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }
}

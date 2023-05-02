import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ExtraPage extends StatefulWidget {
  const ExtraPage({super.key});

  @override
  State<ExtraPage> createState() => _ExtraPageState();
}

class _ExtraPageState extends State<ExtraPage> {
  @override
  void initState() {
    super.initState();
    readJsonMain();
  }

  List _itemsList = [];
  String addText = " ...";
  Future<void> readJsonMain() async {
    final String response = await rootBundle.loadString("assets/sample.json");
    final data = await jsonDecode(response);
    setState(() {
      _itemsList = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Flutter")),
      body: Column(
        children: [
          Expanded(
              child: ListView.builder(
                  itemCount: _itemsList.length,
                  itemBuilder: ((context, index) {
                    return Container(
                        height: 150,
                        margin: const EdgeInsets.all(20),
                        color: Colors.red,
                        child: ListTile(
                            subtitle: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10),
                                child: Text(
                                  _itemsList[index]["extra"],
                                  overflow: TextOverflow.ellipsis,
                                )),
                            trailing: const Icon(Icons.inbox),
                            title: Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: Text(
                                  _itemsList[index]["text"],
                                  style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w800),
                                )),
                            leading: CircleAvatar(
                              backgroundImage:
                                  NetworkImage(_itemsList[index]["src"]),
                            )));
                  })))
        ],
      ),
    );
  }
}

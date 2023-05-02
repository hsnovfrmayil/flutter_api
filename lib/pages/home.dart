import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List _items = [];
  bool answer = false;
  Future<void> readJson() async {
    final String response = await rootBundle.loadString("assets/sample.json");
    final data = await jsonDecode(response);

    setState(() {
      _items = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Flutter")),
      body: Column(
        children: [
          ElevatedButton(
              onPressed: (() {
                if (answer) {
                  setState(() {
                    readJson();
                    answer = false;
                  });
                } else {
                  setState(() {
                    answer = true;
                  });
                }
              }),
              child: const Text("Run")),
          answer
              ? Expanded(
                  child: ListView.builder(
                      itemCount: _items.length,
                      itemBuilder: ((context, index) {
                        return Container(
                          color: Colors.red,
                          height: 200,
                          margin: const EdgeInsets.all(20),
                          child: Text(_items[index]["text"]),
                        );
                      })))
              : const Text("Flutter")
        ],
      ),
    );
  }
}
